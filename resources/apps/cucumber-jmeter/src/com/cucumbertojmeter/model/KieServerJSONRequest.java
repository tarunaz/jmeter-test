package com.cucumbertojmeter.model;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@SuppressWarnings("unchecked")
public class KieServerJSONRequest {

	private JSONObject request;
	private JSONArray commands;

	public KieServerJSONRequest() {
		this.request = new JSONObject();
		this.commands = new JSONArray();
		this.request.put("commands", this.commands);
	}

	public void fireAllRules() {
		JSONObject fireAllRules = new JSONObject();
		fireAllRules.put("fire-all-rules", "");

		this.commands.add(fireAllRules);
	}

	public JSONObject getRequest() {
		return this.request;
	}

	public void insertObject(JSONObject insertObject) {
		JSONObject object = new JSONObject();
		object.put("object", insertObject);

		JSONObject insert = new JSONObject();
		insert.put("insert", object);

		this.commands.add(insert);
	}

	public void lookupKieSession(String kieSession) {
		this.request.put("lookup", kieSession);
	}

	public void query(String queryName, String outIdentifier) {
		JSONObject data = new JSONObject();
		data.put("name", queryName);
		data.put("out-identifier", outIdentifier);

		JSONObject query = new JSONObject();
		query.put("query", data);

		this.commands.add(query);
	}

	public void startProcess(String processID) {
		JSONObject process = new JSONObject();
		process.put("processId", processID);

		JSONObject startProcess = new JSONObject();
		startProcess.put("start-process", process);

		this.commands.add(startProcess);
	}

}
