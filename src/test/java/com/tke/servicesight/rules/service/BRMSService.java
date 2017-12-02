package com.tke.servicesight.rules.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.drools.core.event.DefaultAgendaEventListener;
import org.drools.core.runtime.rule.impl.FlatQueryResults;
import org.kie.api.KieServices;
import org.kie.api.command.BatchExecutionCommand;
import org.kie.api.command.Command;
import org.kie.api.event.rule.AfterMatchFiredEvent;
import org.kie.api.runtime.ExecutionResults;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.StatelessKieSession;
import org.kie.api.runtime.rule.QueryResultsRow;
import org.kie.internal.command.CommandFactory;

import com.tke.servicesight.rules.model.Duration;
import com.tke.servicesight.rules.model.Maintenance;
import com.tke.servicesight.rules.model.Score;
import com.tke.servicesight.rules.model.ValidationError;

public class BRMSService {

	private boolean debug = false;

	private KieContainer kieContainer;
	List<Command<?>> commands;
	ExecutionResults results;

	/**
	 * The constructor that will create the kie container.
	 */
	public BRMSService() {
		kieContainer = KieServices.Factory.get().getKieClasspathContainer();
		commands = new ArrayList<Command<?>>();
	}

	/**
	 * Set the debug option that will enable debug during the rules processing.
	 * 
	 * @param debug
	 */
	public void setDebug(boolean debug) {
		this.debug = debug;
	}

	/**
	 * Initialize the process given the name of the process and a list of facts
	 * to insert into the rules engine.
	 * 
	 * @param process
	 * @param facts
	 */
	public void initializeProcess(Processes process, Object... facts) {
		for (Object fact : facts) {
			commands.add(CommandFactory.newInsert(fact));
		}
		commands.add(CommandFactory.newStartProcess(process.getProcess()));
		commands.add(CommandFactory.newEnableAuditLog("auditbrms.log"));
		commands.add(CommandFactory.newFireAllRules());
	}

	/**
	 * Add queries into the command so that we can get these different results
	 * that are inserted by the rules.
	 * 
	 * @param identifier
	 * @param query
	 */
	public void query(Queries... queries) {
		for (Queries query : queries) {
			commands.add(CommandFactory.newQuery(query.getIdentifier(), query.getQuery()));
		}
	}

	/**
	 * Execute the rules and store the results to be used to retrieve the
	 * response.
	 */
	public void executeRules() {
		StatelessKieSession ksession = this.kieContainer.newStatelessKieSession();
		if (debug) {
			ksession.addEventListener(new DefaultAgendaEventListener() {
				public void afterMatchFired(AfterMatchFiredEvent event) {
					super.afterMatchFired(event);
					System.out.println(event);
				}
			});
		}
		BatchExecutionCommand batch = CommandFactory.newBatchExecution(commands);
		results = ksession.execute(batch);
	}

	@SuppressWarnings("unchecked")
	public List<Duration> getDuration() {
		return (List<Duration>) get(Queries.Duration, Duration.class);
	}

	@SuppressWarnings("unchecked")
	public List<Maintenance> getMaintenances() {
		return (List<Maintenance>) get(Queries.Maintenance, Maintenance.class);
	}

	@SuppressWarnings("unchecked")
	public List<Score> getScores() {
		return (List<Score>) get(Queries.Score, Score.class);
	}

	@SuppressWarnings("unchecked")
	public List<ValidationError> getValidations(Processes process) {
		switch (process) {
		case Duration:
			return (List<ValidationError>) get(Queries.DurationValidation, ValidationError.class);
		case Score:
			return (List<ValidationError>) get(Queries.ScoreValidation, ValidationError.class);
		case Maintenance:
			return (List<ValidationError>) get(Queries.MaintenanceValidation, ValidationError.class);
		default:
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	private <T> List<?> get(Queries query, T clazz) {
		FlatQueryResults queryResults = (FlatQueryResults) results.getValue(query.getIdentifier());
		if (queryResults==null) {
			return null;
		}
		Iterator<QueryResultsRow> iterator = queryResults.iterator();
		return (List<T>) (iterator.hasNext() ? iterator.next().get(query.getIdentifier()) : null);
	}

}
