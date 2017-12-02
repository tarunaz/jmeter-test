package com.tke.servicesight.rules.service;

/**
 * The processes enum defines all of the available processes that were created
 * by the BPMN modeler. These are essentially all of the processes that are
 * defined within the modeler directory under META-INF/rules/modeler.
 * 
 * @author Sunil Samuel (sunil@redhat.com)
 *
 */
public enum Processes {
	//@formatter:off
	Duration("com.tke.servicesight.rules.DurationProcess"),
	Score("com.tke.servicesight.rules.ScoringProcess"), 
	Maintenance("com.tke.servicesight.rules.MaintenanceProcess"), 
	Complete("com.tke.servicesight.rules.CompleteProcess");
	//@formatter:on

	private String process;

	private Processes(String process) {
		this.process = process;
	}

	public String getProcess() {
		return process;
	}
}
