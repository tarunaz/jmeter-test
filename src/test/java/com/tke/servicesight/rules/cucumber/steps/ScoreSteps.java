package com.tke.servicesight.rules.cucumber.steps;

import java.util.List;
import java.util.UUID;

import org.junit.Assert;

import com.tke.servicesight.rules.model.Product;
import com.tke.servicesight.rules.model.Score;
import com.tke.servicesight.rules.model.ValidationError;
import com.tke.servicesight.rules.service.BRMSService;
import com.tke.servicesight.rules.service.Processes;
import com.tke.servicesight.rules.service.Queries;

import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

/**
 * Define cucumber steps for Product Types.
 *
 * @author Sunil Samuel (sunil@redhat.com)
 * @author Christian Witchger (cwitchger@redhat.com)
 *
 */
public class ScoreSteps {
	/**
	 * These objects are used as input (facts) into the BRMS engine
	 */
	private Product product;

	/**
	 * These objects are the results of the rules.
	 */
	private List<ValidationError> validations;
	private List<Score> scores;

	private BRMSService service = new BRMSService();

	@Before
	public void initialize() {
		UUID id = UUID.randomUUID();
		product = new Product();
		product.setId(id.toString());
	}

	@Given(value = "^a TKE unit type ([a-zA-Z0-9-]+) for scoring$")
	public void calculateScoreGivenUnitType(String unitType) {
		product.setUnitType(unitType);
	}

	@When(value = "^the annual callback is (-?[0-9]+)$")
	public void calculateScoreWithAnnualCallback(int annualCallbacks) {
		product.setAnnualCallbacks(annualCallbacks);
	}

	@When(value = "^the control type is ([a-zA-Z0-9-\\ ]+)$")
	public void calculateWithControlType(String controlType) {
		product.setControlType(controlType);
	}

	@When(value = "^the drive type is ([a-zA-Z0-9-/]+)$")
	public void calculateWithDriveType(String driveType) {
		product.setDriveType(driveType);
	}

	@When(value = "^the environment is ([a-zA-Z0-9-]+)$")
	public void calculateWithEnvironment(String environment) {
		product.setEnvironment(environment);
	}

	@When(value = "^the id is ([a-zA-Z0-9-\\ ]+)$")
	public void calculateWithId(String id) {
		product.setId(id);
	}

	@When(value = "^the usage is ([a-zA-Z0-9-]+)$")
	public void calculateWithUsage(String usage) {
		product.setUsage(usage);
	}

	@When(value = "^the score location is ([a-zA-Z0-9- ]+)$")
	public void calculateWithLocation(String location) {
		this.product.setLocation(location);
	}

	@When("^the annual callback is $")
	public void theAnnualCallbackIsNegative() {
		// No operation
	}

	@When("^the control type is $")
	public void theControlTypeIsNull() {
		// No operation
	}

	@When("^the drive type is $")
	public void theDriveTypeIsNull() {
		// No operation
	}

	@When("^the environment is $")
	public void theEnvironmentIsNull() {
		// No operation
	}

	@When("^the usage is $")
	public void theUsageIsNull() {
		// No operation
	}

	@And(value = "^there is no score$")
	public void validateThereIsNoScore() {
		scores = service.getScores();
		if (scores != null) {
			Assert.assertEquals(0, scores.size());
		} else {
			Assert.assertNull(scores);
		}
	}

	@Then(value = "^the total points (is|is not) (-?[0-9]+)$")
	public void validateTotalPoints(String tCase, int totalPoints) {
		service.setDebug(false);
		service.initializeProcess(Processes.Score, product);
		service.query(Queries.Score);
		service.executeRules();
		scores = service.getScores();

		if ("is".equals(tCase)) {
			Assert.assertEquals(Integer.valueOf(totalPoints), scores.get(0).getScore());
		} else {
			Assert.assertNotEquals(totalPoints,
					scores == null || scores.size() == 0 ? this.scores : this.scores.get(0).getScore());
		}
	}

	@Then(value = "^there is a validation error message for scoring stating ([a-zA-Z0-9-\\ ]+)$")
	public void validateValidationErrorMessage(String message) {
		service.initializeProcess(Processes.Score, product);
		service.query(Queries.ScoreValidation);
		service.executeRules();
		validations = service.getValidations(Processes.Score);

		Assert.assertEquals(message,
				validations == null || validations.size() == 0 ? validations : validations.get(0).getMessage());
	}
}
