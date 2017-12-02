package com.tke.servicesight.rules.service;

/**
 * Define all of the queries that are created by the different rules.
 * 
 *
 * The two parameters to the query is the identifier and the query name. The
 * query is defined as follows in the Excel sheet (ConfigurationXXXRules.xls)
 * files.<br>
 * <code>
query "getScores"
  scores: java.util.List () from collect (Score())
  validation: java.util.List () from collect (ValidationError())
end
</code> In this case scores or validation is the identifier (the first
 * parameter) and 'getScores' is the query name (second parameter).
 * 
 * @author Sunil Samuel (sunil@redhat.com)
 */
public enum Queries {
	//@formatter:off
	Duration("durations","getDurations"),
	Score("scores","getScores"),
	Maintenance("maintenances","getMaintenances"),
	ScoreValidation("validation","getScores"),
	DurationValidation("validation","getDurations"),
	MaintenanceValidation("validation","getMaintenances");
	//@formatter:on

	private String identifier;
	private String query;

	private Queries(String identifier, String query) {
		this.identifier = identifier;
		this.query = query;
	}

	public String getIdentifier() {
		return identifier;
	}

	public String getQuery() {
		return query;
	}

}