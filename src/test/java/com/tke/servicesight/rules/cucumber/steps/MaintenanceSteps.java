package com.tke.servicesight.rules.cucumber.steps;

import java.util.List;
import java.util.UUID;

import org.junit.Assert;

import com.tke.servicesight.rules.model.Maintenance;
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

public class MaintenanceSteps {
	/**
	 * These objects are used as input (facts) into the BRMS engine
	 */
	private Product product;
	private Score score;

	/**
	 * These objects are the results of the rules.
	 */
	private List<ValidationError> validations;
	private List<Maintenance> maintenances;

	private BRMSService service = new BRMSService();

	@Before
	public void initialize() {
		UUID id = UUID.randomUUID();
		product = new Product();
		product.setId(id.toString());
		score = new Score(id.toString());
	}

	@When(value = "^the number of openings is (\\d+)$")
	public void calcuateWithOpenings(int openings) {
		this.score.setOpenings(openings);
	}

	@When(value = "^the number of rear openings is (\\d+|.*)$")
	public void rearOpenings(Integer numRearCarDoors) {
		if (numRearCarDoors != null)
			this.product.setNumRearCarDoors(numRearCarDoors);
	}

	@When(value = "^the number of front openings is (\\d+|.*)$")
	public void frontOpenings(Integer numFrontCarDoors) {
		if (numFrontCarDoors != null)
			this.product.setNumFrontCarDoors(numFrontCarDoors);
	}

	@Given(value = "^the cmUnit is (.*)$")
	public void cmUnit(Boolean cmUnit) {
		this.product.setCmUnit(cmUnit);
	}

	@Given(value = "^a TKE unit type ([a-zA-Z0-9-]+) for maintenance$")
	public void calculateGivenUnitType(String unitType) {
		this.product.setUnitType(unitType);
	}

	@When(value = "^the calculated service level is (\\d+)$")
	public void calculateWithServiceLevel(int serviceLevel) {
		this.score.setServiceLevel(serviceLevel);
	}

	@When(value = "^the unit is processed for maintenance$")
	public void executeMaintenanceProcess() {
		service.initializeProcess(Processes.Maintenance, product, score);
		service.query(Queries.Maintenance);
		service.executeRules();
		maintenances = service.getMaintenances();
	}

	@When("^the calculated service level is $")
	public void the_calculated_service_level_is() {
		// No operation
	}

	@When("^the number of openings is $")
	public void the_number_of_openings_is() {
		// No operation
	}

	@And(value = "^CAT1 is (\\d+)$")
	public void validateCat1(int cat1) {
		Assert.assertEquals(Integer.valueOf(cat1), maintenances.get(0).getCat1());
	}

	@And(value = "^IM/L is (\\d+)$")
	public void validateImL(int imL) {
		Assert.assertEquals(Integer.valueOf(imL), maintenances.get(0).getImL());
	}

	@And(value = "^PM/H is (\\d+)$")
	public void validatePmH(int pmH) {
		Assert.assertEquals(Integer.valueOf(pmH), maintenances.get(0).getPmH());
	}

	@Then(value = "^Clean Down is (\\d+)$")
	public void validateCleanDown(int cleanDown) {
		Assert.assertEquals(Integer.valueOf(cleanDown), maintenances.get(0).getCleanDown());
	}

	@And(value = "^IM is (\\d+)$")
	public void validateIm(int im) {
		Assert.assertEquals(Integer.valueOf(im), maintenances.get(0).getIm());
	}

	@And(value = "^PM is (\\d+)$")
	public void validatePm(int pm) {
		Assert.assertEquals(Integer.valueOf(pm), maintenances.get(0).getPm());
	}

	@Then(value = "^PM/D is (\\d+)$")
	public void validatePmd(int pmd) {
		service.initializeProcess(Processes.Maintenance, product, score);
		service.query(Queries.Maintenance);
		service.executeRules();
		maintenances = service.getMaintenances();

		Assert.assertEquals(Integer.valueOf(pmd), maintenances.get(0).getPmd());
	}

	@And(value = "^PM/MMR is (\\d+)$")
	public void validatePmMmr(int pmMmr) {
		Assert.assertEquals(Integer.valueOf(pmMmr), maintenances.get(0).getPmMmr());
	}

	@And(value = "^PT is (\\d+)$")
	public void validatePt(int pt) {
		Assert.assertEquals(Integer.valueOf(pt), maintenances.get(0).getPt());

	}

	@And(value = "^ST is (\\d+)$")
	public void validateSt(int st) {
		Assert.assertEquals(Integer.valueOf(st), maintenances.get(0).getSt());
	}

	@And(value = "^there is no maintenance$")
	public void validateThereIsNoMaintenance() {
		maintenances = service.getMaintenances();
		if (maintenances != null) {
			Assert.assertEquals(0, maintenances.size());
		} else {
			Assert.assertNull(maintenances);
		}
	}

	@Then(value = "^there is a validation error message for maintenance stating ([a-zA-Z0-9-\\ ]+)$")
	public void validateValidationErrorMessage(String message) {
		service.initializeProcess(Processes.Maintenance, product, score);
		service.query(Queries.MaintenanceValidation);
		service.executeRules();
		validations = service.getValidations(Processes.Maintenance);
		Assert.assertEquals(message,
				validations == null || validations.size() == 0 ? validations : validations.get(0).getMessage());
	}

}
