package com.cucumbertojmeter.model;

import java.util.ArrayList;

import org.json.simple.JSONObject;

public class Scenario {
	public String title;
	public ArrayList<JsonDataObject> request;
	public ArrayList<JsonDataObject> response;

	@SuppressWarnings("unchecked")
	public JSONObject getFormattedRequest() {
		JSONObject json = new JSONObject();
		for (JsonDataObject obj : this.request) {
			if (obj.value != null) {
				json.put(obj.key, obj.value);
			}
		}
		return json;
	}

	public ArrayList<JsonDataObject> getRequest() {
		return this.request;
	}

	public ArrayList<JsonDataObject> getResponse() {
		return this.response;
	}

	public String getTitle() {
		return this.title;
	}

	public void setRequest(ArrayList<JsonDataObject> request) {
		this.request = request;
	}

	public void setResponse(ArrayList<JsonDataObject> response) {
		this.response = response;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Scenario [title=" + this.title + ", request=" + this.request + ", response=" + this.response + "]";
	}

}
