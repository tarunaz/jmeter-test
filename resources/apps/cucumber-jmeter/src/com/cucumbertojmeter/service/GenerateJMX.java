package com.cucumbertojmeter.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.jmeter.assertions.ResponseAssertion;
import org.apache.jmeter.assertions.gui.AssertionGui;
import org.apache.jmeter.config.Arguments;
import org.apache.jmeter.config.ConfigTestElement;
import org.apache.jmeter.control.LoopController;
import org.apache.jmeter.control.gui.LoopControlPanel;
import org.apache.jmeter.control.gui.TestPlanGui;
import org.apache.jmeter.protocol.http.config.gui.HttpDefaultsGui;
import org.apache.jmeter.protocol.http.control.AuthManager;
import org.apache.jmeter.protocol.http.control.Authorization;
import org.apache.jmeter.protocol.http.control.Header;
import org.apache.jmeter.protocol.http.control.HeaderManager;
import org.apache.jmeter.protocol.http.control.gui.HttpTestSampleGui;
import org.apache.jmeter.protocol.http.gui.AuthPanel;
import org.apache.jmeter.protocol.http.gui.HTTPArgumentsPanel;
import org.apache.jmeter.protocol.http.gui.HeaderPanel;
import org.apache.jmeter.protocol.http.sampler.HTTPSamplerProxy;
import org.apache.jmeter.protocol.http.util.HTTPArgument;
import org.apache.jmeter.reporters.ResultCollector;
import org.apache.jmeter.save.SaveService;
import org.apache.jmeter.testelement.TestElement;
import org.apache.jmeter.testelement.TestPlan;
import org.apache.jmeter.testelement.property.TestElementProperty;
import org.apache.jmeter.threads.ThreadGroup;
import org.apache.jmeter.threads.gui.ThreadGroupGui;
import org.apache.jmeter.util.JMeterUtils;
import org.apache.jmeter.visualizers.ViewResultsFullVisualizer;
import org.apache.jorphan.collections.HashTree;
import org.json.simple.JSONObject;

/**
 * This class is used as a base for the necessary configuration and setup for JMeter.
 * The default values for the instance variables should be set in the implementation constructor
 */
public abstract class GenerateJMX {
	public static List<String> lines;
	protected String httpPort = "80";
	protected String httpUrl = "";
	protected String httpPath = "";
	protected String testPlanName = "Test Plan";
	protected String authPassword = "admin";
	protected String authUsername = "admin";
	protected HashTree testHashTree = null;
	protected HashTree testPlanHashTree = null;
	protected String jmeterHome = "/apache-jmeter-3.0";
	protected String jmeterProperties = "jmeter.properties";
	protected HashTree threadGroupHashTree = null;
	protected TestPlan testPlan = null;
	protected ThreadGroup threadGroup;
	protected String jmxFileName;

	/**
	 * Adds the default authentication for all HTTP requests
	 */
	public void addBasicAuthentication() {
		Authorization auth = new Authorization();
		auth.setUser(this.authUsername);
		auth.setPass(this.authPassword);
		auth.setURL("");

		AuthManager authManager = new AuthManager();
		authManager.setEnabled(true);
		authManager.setName("HTTP Authorization Manager");
		authManager.getClearEachIteration();
		authManager.addAuth(auth);
		authManager.setProperty(TestElement.TEST_CLASS, AuthManager.class.getName());
		authManager.setProperty(TestElement.GUI_CLASS, AuthPanel.class.getName());

		this.testPlanHashTree.add(authManager);
	}

	public abstract void addConfiguration();

	/**
	 * Adds the default HTTP endpoint for all thread groups
	 */
	public void addHTTPEndpoint() {
		ConfigTestElement configTestElement = new ConfigTestElement();

		TestElementProperty elementProperty = new TestElementProperty();
		elementProperty.setName("HTTPsampler.Arguments");

		Arguments args = new Arguments();
		args.setProperty(TestElement.TEST_CLASS, Arguments.class.getName());
		args.setProperty(TestElement.GUI_CLASS, HTTPArgumentsPanel.class.getName());
		elementProperty.setElement(args);
		configTestElement.setProperty(elementProperty);

		configTestElement.setProperty("HTTPSampler.domain", this.httpUrl);
		configTestElement.setProperty("HTTPSampler.port", this.httpPort);
		configTestElement.setProperty("HTTPSampler.protocol", "http");
		configTestElement.setProperty("HTTPSampler.path", this.httpPath);
		configTestElement.setProperty("HTTPSampler.implementation", "HttpClient3.1");
		configTestElement.setProperty("HTTPSampler.concurrentPool", "6");
		configTestElement.setEnabled(true);
		configTestElement.setName("Requests Defaults");
		configTestElement.setProperty(TestElement.TEST_CLASS, ConfigTestElement.class.getName());
		configTestElement.setProperty(TestElement.GUI_CLASS, HttpDefaultsGui.class.getName());

		this.testPlanHashTree.add(configTestElement);
	}

	/**
	 * Adds the headers needed for the kie server
	 */
	public void addKieHeaders() {
		HeaderManager headerManager = new HeaderManager();
		headerManager.add(new Header("content-type", "application/json"));
		headerManager.add(new Header("accept", "application/json"));
		headerManager.add(new Header("X-KIE-ContentType", "JSON"));
		headerManager.setName("HTTP Header Manager");
		headerManager.setProperty(TestElement.TEST_CLASS, HeaderManager.class.getName());
		headerManager.setProperty(TestElement.GUI_CLASS, HeaderPanel.class.getName());
		this.testPlanHashTree.add(headerManager);
	}

	public void addThreadGroup(String threadGroupName) {
		// ThreadGroup controller
		LoopController loopController = new LoopController();
		loopController.setEnabled(true);
		loopController.setLoops(1);
		loopController.setProperty(TestElement.TEST_CLASS, LoopController.class.getName());
		loopController.setProperty(TestElement.GUI_CLASS, LoopControlPanel.class.getName());

		// ThreadGroup
		this.threadGroupHashTree = new HashTree();
		this.threadGroup = new ThreadGroup();
		this.threadGroup.setName(threadGroupName);
		this.threadGroup.setEnabled(true);
		this.threadGroup.setSamplerController(loopController);
		this.threadGroup.setNumThreads(1);
		this.threadGroup.setRampUp(1);
		this.threadGroup.setProperty(TestElement.TEST_CLASS, ThreadGroup.class.getName());
		this.threadGroup.setProperty(TestElement.GUI_CLASS, ThreadGroupGui.class.getName());
	}

	public void closeThreadGroup() {
		this.testHashTree.add(this.threadGroup, this.threadGroupHashTree);
	}

	public void createGenerateJMX() {
		JMeterUtils.loadJMeterProperties(this.jmeterProperties);
		JMeterUtils.setJMeterHome(this.jmeterHome);

		// TestPlan
		this.testPlan = new TestPlan();
		this.testPlan.setName(this.testPlanName);
		this.testPlan.setEnabled(true);
		this.testPlan.setComment("");
		this.testPlan.setFunctionalMode(false);
		this.testPlan.setSerialized(false);
		this.testPlan.setProperty(TestElement.TEST_CLASS, TestPlan.class.getName());
		this.testPlan.setProperty(TestElement.GUI_CLASS, TestPlanGui.class.getName());

		// Create TestPlan hash tree
		this.testHashTree = new HashTree();
		this.testPlanHashTree = new HashTree();

		this.testHashTree.add(this.testPlan);
	}

	public ResponseAssertion createResponseAssertion() {
		ResponseAssertion assertion = new ResponseAssertion();
		assertion.setName("Check response");
		assertion.setProperty(TestElement.TEST_CLASS, ResponseAssertion.class.getName());
		assertion.setProperty(TestElement.GUI_CLASS, AssertionGui.class.getName());
		assertion.setAssumeSuccess(false);
		assertion.setTestFieldResponseData();
		return assertion;
	}

	public String escapeValue(String value) {
		String response = "";

		try {
			Integer.parseInt(value);
			response = value;
		} catch (NumberFormatException n) {
			try {
				Double.parseDouble(value);
				response = value;
			} catch (NumberFormatException u) {
				response = "\"" + value + "\"";
			}
		}

		return response;
	}

	public HTTPSamplerProxy getHTTPJSONTest(String testName, String method, JSONObject request) {
		// Add request
		HTTPSamplerProxy httpSamplerProxy = new HTTPSamplerProxy();
		httpSamplerProxy.setName(testName);
		httpSamplerProxy.setMethod(method);
		httpSamplerProxy.setPostBodyRaw(true);
		httpSamplerProxy.setProperty(TestElement.TEST_CLASS, HTTPSamplerProxy.class.getName());
		httpSamplerProxy.setProperty(TestElement.GUI_CLASS, HttpTestSampleGui.class.getName());

		HTTPArgument argument = new HTTPArgument();
		argument.setValue(request.toJSONString());
		argument.setAlwaysEncoded(false);
		argument.setMetaData("=");

		Arguments arguments = new Arguments();
		arguments.addArgument(argument);

		httpSamplerProxy.setArguments(arguments);

		return httpSamplerProxy;
	}

	public void saveJMXFile() {
		ResultCollector resultCollector = new ResultCollector();
		resultCollector.setName("Results Tree");
		resultCollector.setErrorLogging(false);
		resultCollector.setProperty(TestElement.TEST_CLASS, ResultCollector.class.getName());
		resultCollector.setProperty(TestElement.GUI_CLASS, ViewResultsFullVisualizer.class.getName());

		this.testPlanHashTree.add(resultCollector);

		this.testHashTree.add(this.testPlan, this.testPlanHashTree);

		// Save to JMX file
		try {
			// Initialize JMeter SaveService
			SaveService.loadProperties();
			FileOutputStream out = new FileOutputStream(this.jmxFileName);

			SaveService.saveTree(this.testHashTree, out);
			out.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
