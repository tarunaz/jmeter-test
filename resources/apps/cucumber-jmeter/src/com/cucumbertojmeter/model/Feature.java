package com.cucumbertojmeter.model;

import java.util.ArrayList;

public class Feature {
	private String title;
	private ArrayList<Scenario> scenarios;
	private ArrayList<String> flags;

	public Feature() {
		this.scenarios = new ArrayList<Scenario>();
		this.setFlags(new ArrayList<String>());
	}

	public void addScenario(Scenario scenario) {
		this.scenarios.add(scenario);
	}

	public ArrayList<String> getFlags() {
		return this.flags;
	}

	public ArrayList<Scenario> getScenarios() {
		return this.scenarios;
	}

	public String getTitle() {
		String prefix = "";
		if (this.flags.size() != 0) {
			for (String flag : this.flags) {
				prefix += flag + " ";
			}
			prefix += "- ";
		}

		return prefix + this.title;
	}

	public void setFlags(ArrayList<String> flags) {
		this.flags = flags;
	}

	public void setScenarios(ArrayList<Scenario> scenarios) {
		this.scenarios = scenarios;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Feature [title=" + this.title + ", scenarios=" + this.scenarios + "]";
	}

}
