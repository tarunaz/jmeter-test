package com.tke.servicesight.rules.cucumber.steps;

import java.util.UUID;

import org.junit.Assert;

import com.tke.servicesight.rules.model.Product;
import com.tke.servicesight.rules.model.Score;
import com.tke.servicesight.rules.service.BRMSService;
import com.tke.servicesight.rules.service.Processes;

import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class ServiceLevelSteps {
	/**
	 * These objects are used as input (facts) into the BRMS engine
	 */
	private Product product;
	private Score score;

	/**
	 * These objects are the results of the rules.
	 */
	private BRMSService service = new BRMSService();

	@Before
	public void initialize() {
		UUID id = UUID.randomUUID();
		product = new Product();
		product.setId(id.toString());
		score = new Score(id.toString());
	}

	@Given(value = "^a TKE unit type ([a-zA-Z0-9-]+) for service level$")
	public void calculateServiceLevelGivenUnitType(String unitType) {
		product.setUnitType(unitType);
	}

	@When(value = "^the score is (-?[0-9]+)$")
	public void calculateServiceLevelWhenScore(int value) {
		score.setScore(value);
	}

	@Then(value = "^the service level (is|is not) (-?[0-9]+)$")
	public void validServiceLevel(String tCase, int serviceLevel) {
		service.initializeProcess(Processes.Score, product, score);
		service.executeRules();

		if ("is".equals(tCase)) {
			Assert.assertEquals(Integer.valueOf(serviceLevel), score.getServiceLevel());
		} else {
			Assert.assertNotEquals(serviceLevel, score == null ? score : score.getServiceLevel());
		}
	}

}
