package com.tke.servicesight.rules.cucumber.steps;

import java.util.List;
import java.util.UUID;

import org.junit.Assert;

import com.tke.servicesight.rules.model.Duration;
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

public class DurationSteps {
	/**
	 * These objects are used as input (facts) into the BRMS engine
	 */
	private Product product;
	private Score score;

	/**
	 * These objects are the results of the rules.
	 */
	private List<ValidationError> validations;
	private List<Duration> durations;

	private BRMSService service = new BRMSService();

	@Before
	public void initialize() {
		UUID id = UUID.randomUUID();
		product = new Product();
		product.setId(id.toString());
		score = new Score(id.toString());
	}

	@Given(value = "^a TKE unit type ([a-zA-Z0-9-]+) for duration$")
	public void calculateGivenUnitTypeForDuration(String unitType) {
		this.product.setUnitType(unitType);
	}

	@When(value = "^the bi-parting power door modifier is (.*)$")
	public void calculateWithBipartingPowerDoor(String modifier) {
		this.product.setBipartingPowerDoor(Boolean.parseBoolean(modifier));
	}

	@When(value = "^the number of front car doors is (.*)$")
	public void calculateWithFrontCarDoor(Integer modifier) {
		this.product.setNumFrontCarDoors(modifier);
	}

	@When(value = "^the number of openings for duration is (.*)$")
	public void numberOfOpenings(Integer openings) {
		this.score.setOpenings(openings);
	}

	@When(value = "^the number of front openings for duration is (\\d+|.*)$")
	public void frontOpenings(Integer frontDoors) {
		this.product.setNumFrontCarDoors(frontDoors);
	}

	@When(value = "^the number of rear openings for duration is (\\d+|.*)$")
	public void rearOpenings(Integer rearOpenings) {
		this.product.setNumRearCarDoors(rearOpenings);
	}

	@When(value = "^the cmUnit for duration is (.*)$")
	public void cmUnit(Boolean cmUnit) {
		this.product.setCmUnit(cmUnit);
	}

	@When(value = "^the number of rear car doors is (.*)$")
	public void calculateWithRearCarDoor(Integer modifier) {
		this.product.setNumRearCarDoors(modifier);
	}

	@And(value = "^the foreign equipment modifier is (.*)$")
	public void calculateWithForeignEquipment(String modifier) {
		this.product.setForeignEquipment(Boolean.parseBoolean(modifier));
	}

	@And(value = "^the freight door modifier is (.*)$")
	public void calculateWithFreightDoor(String modifier) {
		this.product.setFreightDoor(Boolean.parseBoolean(modifier));
	}

	@When(value = "^the duration location is ([a-zA-Z0-9- ]+)$")
	public void calculateWithLocation(String location) {
		this.product.setLocation(location);
	}

	@When(value = "^the calculated service level for duration is (\\d+)$")
	public void calculateWithServiceLevel(int serviceLevel) {
		this.score.setServiceLevel(serviceLevel);
	}

	@When(value = "^the duration usage is ([a-zA-Z0-9-]+)$")
	public void calculateWithUsage(String usage) {
		this.product.setUsage(usage);
	}

	@When(value = "^the unit is processed for duration$")
	public void executeDurationProcess() {
		service.setDebug(false);
		service.initializeProcess(Processes.Duration, product, score);
		service.query(Queries.Duration);
		service.executeRules();
		durations = service.getDuration();
	}

	@And(value = "^duration CAT1 is (\\d*\\.?\\d*)$")
	public void validateCat1(double cat1) {
		Assert.assertEquals(cat1, durations.get(0).getCat1(), 0.001);
	}

	@And(value = "^duration Clean Down is (\\d*\\.?\\d*)$")
	public void validateCleanDown(double cleanDown) {
		Assert.assertEquals(cleanDown, durations.get(0).getCleanDown(), 0.001);
	}

	@And(value = "^duration IM is (\\d*\\.?\\d*)$")
	public void validateIm(double im) {
		Assert.assertEquals(im, durations.get(0).getIm(), 0.001);
	}

	@And(value = "^duration IM/L is (\\d*\\.?\\d*)$")
	public void validateImL(double im) {
		Assert.assertEquals(im, durations.get(0).getImL(), 0.001);
	}

	@And(value = "^duration PM is (\\d*\\.?\\d*)$")
	public void validatePm(double pm) {
		Assert.assertEquals(pm, durations.get(0).getPm(), 0.001);
	}

	@And(value = "^duration PM/H is (\\d*\\.?\\d*)$")
	public void validatePmH(double pm) {
		Assert.assertEquals(pm, durations.get(0).getPmH(), 0.001);
	}

	@Then(value = "^duration PM/D is (\\d*\\.?\\d*)$")
	public void validatePmd(double pmd) {
		Assert.assertEquals(pmd, durations.get(0).getPmd(), 0.001);
	}

	@And(value = "^duration PM/MMR is (\\d*\\.?\\d*)$")
	public void validatePmMmr(double pmMmr) {
		Assert.assertEquals(pmMmr, durations.get(0).getPmMmr(), 0.001);
	}

	@And(value = "^duration PT is (\\d*\\.?\\d*)$")
	public void validatePt(double pt) {
		Assert.assertEquals(pt, durations.get(0).getPt(), 0.001);
	}

	@And(value = "^duration ST is (\\d*\\.?\\d*)$")
	public void validateSt(double st) {
		Assert.assertEquals(st, durations.get(0).getSt(), 0.001);
	}

	@And(value = "^there is no duration$")
	public void validateThereIsNoDuration() {
		durations = service.getDuration();
		if (durations != null) {
			Assert.assertEquals(0, durations.size());
		} else {
			Assert.assertNull(durations);
		}
	}

	@Then(value = "^there is a validation error message for duration stating ([a-zA-Z0-9-\\ ]+)$")
	public void validateValidationErrorMessage(String message) {
		service.initializeProcess(Processes.Duration, product, score);
		service.query(Queries.DurationValidation);
		service.executeRules();
		validations = service.getValidations(Processes.Duration);
		Assert.assertEquals(message,
				validations == null || validations.size() == 0 ? validations : validations.get(0).getMessage());
	}

}
