package com.cucumbertojmeter.tke.servicesight.rules;

import org.apache.jmeter.assertions.ResponseAssertion;
import org.apache.jmeter.protocol.http.sampler.HTTPSamplerProxy;
import org.json.simple.JSONObject;

import com.cucumbertojmeter.model.Feature;
import com.cucumbertojmeter.model.JsonDataObject;
import com.cucumbertojmeter.model.KieServerJSONRequest;
import com.cucumbertojmeter.model.Scenario;
import com.cucumbertojmeter.service.GenerateJMX;

/**
 * The service sight implementation for the JMX generator
 */
public class ServiceSightRulesJMX extends GenerateJMX {

	protected static String SCORING_QUERY_NAME = "getScores";
	protected static String MAINTENANCE_QUERY_NAME = "getMaintenances";
	protected static String DURATION_QUERY_NAME = "getDurations";
	protected static String SCORING_TYPE = "com.tke.servicesight.rules.model.Score";
	protected static String DURATION_TYPE = "com.tke.servicesight.rules.model.Duration";
	protected static String PRODUCT_TYPE = "com.tke.servicesight.rules.model.Product";
	protected static String MAINTENANCE_TYPE = "com.tke.servicesight.rules.model.Maintenance";
	protected static String MAINTENANCE_PROCESS_ID = "com.tke.servicesight.rules.MaintenanceProcess";
	protected static String SCORING_PROCESS_ID = "com.tke.servicesight.rules.ScoringProcess";
	protected static String DURATION_PROCESS_ID = "com.tke.servicesight.rules.DurationProcess";

	private static String MAINTENANCE_FLAG = "Maintenance";
	private static String SCORE_FLAG = "Score";
	private static String DURATION_FLAG = "Duration";

	public ServiceSightRulesJMX(String jmeterHome, String outputFileName) {
		this.jmeterHome = jmeterHome;
		this.jmeterProperties = this.jmeterHome + "/bin/jmeter.properties";

		this.jmxFileName = outputFileName;

		this.testPlanName = "Service Sight Rules";
		this.httpPort = "80";
		// Once the environment is added, change to: this.httpUrl =
		// "${__P(hostname,tke-rules-servicesight-rules-dev.3a7a.tke.openshiftapps.com)}";
		this.httpUrl = "${__P(hostname,service-sight-rules-playground.3a7a.tke.openshiftapps.com)}";
		this.httpPath = "/kie-server/services/rest/server/containers/instances/planning";
		this.authPassword = "kieserver1!";
		this.authUsername = "kieserver";

		createGenerateJMX();

		addConfiguration();
	}

	@Override
	public void addConfiguration() {
		addBasicAuthentication();
		addKieHeaders();
		addHTTPEndpoint();
	}

	public void addThreadGroupFeature(Feature feature) {
		addThreadGroup(feature.getTitle());

		String featureType = "";
		if (feature.getFlags().contains(MAINTENANCE_FLAG)) {
			featureType = MAINTENANCE_FLAG;
		} else if (feature.getFlags().contains(SCORE_FLAG)) {
			featureType = SCORE_FLAG;
		} else if (feature.getFlags().contains(DURATION_FLAG)) {
			featureType = DURATION_FLAG;
		}

		for (Scenario scenario : feature.getScenarios()) {
			HTTPSamplerProxy sampler = getHTTPJSONTest(scenario.getTitle(), "POST",
					createJSONRequest(scenario, featureType));

			ResponseAssertion assertion = createResponseAssertion();
			for (JsonDataObject obj : scenario.getResponse()) {
				String object = "\"" + obj.getKey() + "\" : " + escapeValue(obj.getValue());
				assertion.addTestString(object);
			}

			this.threadGroupHashTree.add(sampler);
			this.threadGroupHashTree.add(sampler, assertion);
		}

	}

	@SuppressWarnings("unchecked")
	private JSONObject createJSONRequest(Scenario scenario, String featureType) {
		KieServerJSONRequest json = new KieServerJSONRequest();

		String processID = "";
		String queryName = "";
		String outIdentifier = "response";
		String kieSession = "defaultStatelessKieSession";
		JSONObject product = new JSONObject();
		JSONObject request = scenario.getFormattedRequest();

		if (featureType.equals(SCORE_FLAG)) {
			processID = SCORING_PROCESS_ID;
			queryName = SCORING_QUERY_NAME;
		} else if (featureType.equals(MAINTENANCE_FLAG)) {
			processID = MAINTENANCE_PROCESS_ID;
			queryName = MAINTENANCE_QUERY_NAME;
		} else if (featureType.equals(DURATION_FLAG)) {
			processID = DURATION_PROCESS_ID;
			queryName = DURATION_QUERY_NAME;
		}

		if (featureType.equals(MAINTENANCE_FLAG) || featureType.equals(DURATION_FLAG)) {
			json.insertObject(createScorigRequest(request));
		}

		product.put(PRODUCT_TYPE, request);
		json.insertObject(product);
		json.startProcess(processID);
		json.fireAllRules();
		json.query(queryName, outIdentifier);
		json.lookupKieSession(kieSession);

		return json.getRequest();
	}

	@SuppressWarnings("unchecked")
	private JSONObject createScorigRequest(JSONObject request) {
		JSONObject scoringRequest = new JSONObject();

		String serviceLevelKey = "serviceLevel";
		Object serviceLevel = request.remove(serviceLevelKey);
		if (serviceLevel != null) {
			scoringRequest.put(serviceLevelKey, serviceLevel);
		}

		String openingsKey = "openings";
		Object openings = request.remove(openingsKey);
		if (openings != null) {
			scoringRequest.put(openingsKey, openings);
		}

		String idKey = "id";
		Object id = request.get(idKey);
		if (id != null) {
			scoringRequest.put(idKey, id);
		}

		JSONObject score = new JSONObject();
		score.put(SCORING_TYPE, scoringRequest);
		return score;
	}

}
