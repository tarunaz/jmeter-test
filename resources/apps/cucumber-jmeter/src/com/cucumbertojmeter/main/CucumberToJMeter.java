package com.cucumbertojmeter.main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import com.cucumbertojmeter.model.Feature;
import com.cucumbertojmeter.service.ExtractData;
import com.cucumbertojmeter.tke.servicesight.rules.ServiceSightRulesJMX;

/**
 * The Cucumber to JMeter application converts Cucumber tests into JMeter HTTP requests.
 */
public class CucumberToJMeter {

	/**
	  * The project directory variable should be set to the project directory.
	 */
	public static String projectDirName = "service-sight-rules/";

	/**
	 * The featureBase directory variable should be set to the base directory for the feature files.
	
	 */
	public static String featureBase = "src/test/resources/cucumber-features/";

	/**
	 *  The jmxFileLocation directory and file name variable should be set to the save location for the JMeter file.
	 */
	public static String jmxFileLocation = "resources/jmeter/TKE_Scoring.jmx";

	/**
	 *  If there are sub folders with a limited subset of feature files, those should be defined in the featureFolders variable.
	
	 */
	public static ArrayList<String> featureFolders = new ArrayList<String>() {
		private static final long serialVersionUID = 1L;
		{
			add("duration");
			add("maintenance");
			add("score");
		}
	};

	/**
	 * Creates a JMeter thread group for each cucumber feature file, and creates HTTP requests for each test in the feature file.
	 *
	 * The location of the JMeter applicator must be given as a argument when running the program. ex)
	 * 		/home/cwitchge/Documents/apache-jmeter-3.0/
	 *
	 * @param args Location to the JMeter application folder
	 */
	public static void main(String[] args) {
		ArrayList<Feature> features = new ArrayList<Feature>();
		String outputFileName = "";

		try {
			String currentDirectory = new File(new File(".").getAbsolutePath()).getParent();
			int projectBaseIndex = currentDirectory.indexOf(projectDirName);
			currentDirectory = currentDirectory.substring(0, projectBaseIndex + projectDirName.length());

			outputFileName = currentDirectory + jmxFileLocation;

			// Gather the feature files
			ArrayList<File> listOfFiles = new ArrayList<File>();
			for (String featureFolder : featureFolders) {
				File folder = new File(currentDirectory + featureBase + featureFolder);
				listOfFiles.addAll(Arrays.asList(folder.listFiles()));
			}

			// Convert the feature files into Feature objects
			for (File file : listOfFiles) {
				if (file.isFile()) {
					FileReader fileReader = new FileReader(file.getPath());
					BufferedReader bufferedReader = new BufferedReader(fileReader);

					features.add(ExtractData.createFeature(bufferedReader));

					bufferedReader.close();
				}
			}

		} catch (

		FileNotFoundException ex) {
			System.out.println("Unable to open file");
		} catch (IOException ex) {
			System.out.println("Error reading file");
			ex.printStackTrace();
		}

		if (args[0] == null || args[0].equals("")) {
			System.out.println(
					"Please provide the path to the JMeter folder as the first argument when running the converter.");
		} else {
			ServiceSightRulesJMX jmx = new ServiceSightRulesJMX(args[0], outputFileName);

			for (Feature f : features) {
				jmx.addThreadGroupFeature(f);
				jmx.closeThreadGroup();
			}
			jmx.saveJMXFile();
		}
	}
}
