package com.cucumbertojmeter.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import com.cucumbertojmeter.model.Feature;
import com.cucumbertojmeter.model.JsonDataObject;
import com.cucumbertojmeter.model.Scenario;

/**
 * Extracts data from a feature file and creates a feature object.
 *
 */
public class ExtractData {

	/**
	 * The keyMap is a map that contains the conversion from the cucumber variable names to the actual request variable names.
	 */
	public static HashMap<String, String> keyMap;
	static {
		keyMap = new HashMap<String, String>();
		keyMap.put("Elevator Type", "elevatorType");
		keyMap.put("Service Level", "serviceLevel");
		keyMap.put("Openings", "openings");
		keyMap.put("totalPoints", "score");
		keyMap.put("annualCallback", "annualCallbacks");
		keyMap.put("pm-mmr", "pmMmr");
		keyMap.put("pmmmr", "pmMmr");
	}

	/**
	 * Extracts the flags found at the beginning of a feature file
	 */
	private static void addTagsToFeature(Feature feature, String line) {
		ArrayList<String> flags = new ArrayList<String>();
		String[] tags = line.split(" ");
		for (String tag : tags) {
			flags.add(tag.replace("@", ""));
		}
		feature.setFlags(flags);
	}

	/**
	 * Creates the feature object given a buffer reader for the feature file
	 */
	public static Feature createFeature(BufferedReader bufferedReader) {
		Feature feature = new Feature();
		String line = "";
		String scenarioTitle = "";
		int conditionVariableCount = 0;
		int resultVariableCount = 0;
		int scenarioCount = 0;

		try {
			if ((line = bufferedReader.readLine()) != null && line.contains("@")) {
				addTagsToFeature(feature, line);
			}

			if ((line = bufferedReader.readLine()) != null && line.contains("Feature:")) {
				feature.setTitle(line.substring(9));
			}

			boolean notThen = true;

			while ((line = bufferedReader.readLine()) != null) {
				if (line.contains("Scenario Outline:")) {
					scenarioTitle = line.substring(20);
				} else if (notThen && (line.contains("  Given") || line.contains("  When") || line.contains("  And"))) {
					if (line.contains(">")) {
						conditionVariableCount++;
					}
				} else if (line.contains("  Then") || line.contains("  And")) {
					notThen = false;
					if (line.contains(">")) {
						resultVariableCount++;
					}
				} else if (line.contains("Examples:")) {
					notThen = true;
					break;
				}
			}

			ArrayList<String> keys = getKeys(bufferedReader);

			while ((line = bufferedReader.readLine()) != null) {
				if (feature != null && line.contains("|")) {
					Scenario scenario = new Scenario();
					ArrayList<JsonDataObject> request = new ArrayList<JsonDataObject>();
					ArrayList<JsonDataObject> response = new ArrayList<JsonDataObject>();

					ArrayList<String> values = getParameters(line);

					for (int i = 0; i < conditionVariableCount; i++) {
						request.add(new JsonDataObject(keys.get(i), values.get(i)));
					}

					for (int i = 0; i < resultVariableCount; i++) {
						response.add(new JsonDataObject(keys.get(i + conditionVariableCount),
								values.get(i + conditionVariableCount)));
					}

					scenario.setRequest(request);
					scenario.setResponse(response);
					scenario.setTitle(scenarioTitle + " - " + scenarioCount);
					scenarioCount++;

					feature.addScenario(scenario);
				}
			}

			bufferedReader.close();

		} catch (IOException ex) {
			System.out.println("Error reading file");
			ex.printStackTrace();
		}

		return feature;

	}

	/**
	 * Gets the keys from a line in the feature file
	 */
	private static ArrayList<String> getKeys(BufferedReader bufferedReader) throws IOException {
		String line;
		ArrayList<String> parameters = new ArrayList<String>();

		if ((line = bufferedReader.readLine()) != null && line.contains("|")) {
			String[] keys = line.split("\\|");

			for (int i = 1; keys.length > i; i++) {
				String key = keys[i].replaceAll("\\A\\s+", "").replaceAll("\\s+\\Z", "");
				if (keyMap.get(key) != null) {
					key = keyMap.get(key);
				}

				parameters.add(key);
			}
		}

		return parameters;
	}

	/**
	 * Gets the variables from a single line in the feature file
	 */
	private static ArrayList<String> getParameters(String line) {
		ArrayList<String> parameters = new ArrayList<String>();

		if (line.contains("|")) {
			String[] params = line.split("\\|");

			for (int i = 1; params.length > i; i++) {
				String param = params[i].replaceAll("\\A\\s+", "").replaceAll("\\s+\\Z", "");
				if (param.equals("")) {
					param = null;
				}

				parameters.add(param);
			}
		}

		return parameters;
	}

}
