package com.tke.servicesight.rules.cucumber.steps;

import java.util.List;
import java.util.UUID;

import org.junit.Assert;

import com.tke.servicesight.rules.model.Bronze;
import com.tke.servicesight.rules.model.Duration;
import com.tke.servicesight.rules.model.Maintenance;
import com.tke.servicesight.rules.model.Product;
import com.tke.servicesight.rules.model.Score;
import com.tke.servicesight.rules.service.BRMSService;
import com.tke.servicesight.rules.service.Processes;
import com.tke.servicesight.rules.service.Queries;

import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class CompleteSteps {
	/**
	 * These objects are used as input (facts) into the BRMS engine
	 */
	private Product product;
	private Score score;
	private Bronze bronze;

	/**
	 * These objects are the results of the rules.
	 */
	private List<Score> scores;
	private List<Maintenance> maintenances;
	private List<Duration> durations;

	private BRMSService service = new BRMSService();

	@Before
	public void initialize() {
		UUID id = UUID.randomUUID();
		product = new Product();
		product.setId(id.toString());
		score = new Score(id.toString());
		bronze = new Bronze(id.toString());
	}

	/**
	 * Setter :: P R O D U C T
	 */

	@Given("^a TKE unit type ([a-zA-Z0-9-]+) for complete process$")
	public void setUnitType(String unitType) {
		product.setUnitType(unitType);
	}

	@And("^the annual callback for complete process is (-?[0-9]+)$")
	public void setAnnualCallback(int annualCallbacks) {
		product.setAnnualCallbacks(annualCallbacks);
	}

	@And("^the control type for complete process is ([a-zA-Z0-9-\\ ]+)$")
	public void setControlType(String controlType) {
		product.setControlType(controlType);
	}

	@And("^the environment for complete process is ([a-zA-Z0-9-]+)$")
	public void setEnvironment(String environment) {
		product.setEnvironment(environment);
	}

	@And("^the usage for complete process is ([a-zA-Z0-9-]+)$")
	public void setUsage(String usage) {
		product.setUsage(usage);
	}

	@Given("^the foreign equipment for complete process is (\\S*)$")
	public void setForeignEquipment(Boolean fe) {
		product.setForeignEquipment(fe);
	}

	@Given("^the complete bi-parting power door for complete process is (\\S*)$")
	public void setBiparting(Boolean bipartingPowerDoor) {
		product.setBipartingPowerDoor(bipartingPowerDoor);
	}

	@Given("^the complete freight door is (\\S*)$")
	public void setFreightDoor(Boolean freightDoor) {
		product.setFreightDoor(freightDoor);
	}

	@Given("^the complete drive type is (\\S*)$")
	public void setDriveType(String driveType) {
		product.setDriveType(driveType);
	}

	/**
	 * Setter :: S C O R E
	 */

	@Given("^the number of openings for complete process is (\\d+)$")
	public void setNumberOfOpenings(int openings) {
		score.setOpenings(openings);
	}

	/**
	 * Setter :: B R O N Z E
	 */

	@Given("the bronze required frequency is (\\S*)$")
	public void setBronzeFrequency(Boolean frequency) {
		bronze.setFrequency(frequency);
	}

	@Given("the bronze required frequency value is (\\S*)$")
	public void setBronzeFrequencyValue(Integer frequencyValue) {
		bronze.setFrequencyValue(frequencyValue);
	}

	@Given(value = "^a bronze coverage type of (\\S*)$")
	public void setCoverageType(String coverageType) {
		bronze.setCoverageType(coverageType);
	}

	@Given("^the bronze required duration is (\\S*)$")
	public void setBronzeDuration(Boolean requiredDuration) {
		bronze.setDuration(requiredDuration);
	}

	@Given("^the bronze required duration value is (\\S*)$")
	public void setBronzeFrequencyValue(Double requiredDurationValue) {
		bronze.setDurationValue(requiredDurationValue);
	}

	/**
	 * Consequences
	 */

	@When("^I calculate the complete process$")
	public void calculateCompleteProcess() {
		service.initializeProcess(Processes.Complete, product, score);
		service.query(Queries.Score, Queries.Maintenance, Queries.Duration);
		service.executeRules();
		scores = service.getScores();
		maintenances = service.getMaintenances();
		durations = service.getDuration();
	}

	@When("^I calculate bronze$")
	public void calculateBronzes() {
		service.initializeProcess(Processes.Complete, product, score, bronze);
		service.query(Queries.Score, Queries.Maintenance, Queries.Duration);
		service.executeRules();
		durations = service.getDuration();
		maintenances = service.getMaintenances();
		System.out.println(durations);
		System.out.println(maintenances);
		System.out.println(bronze);
	}

	/**
	 * Validate :: P R O D U C T
	 */

	@Then("^the complete product type is (\\S+)$")
	public void validateProductType(String productType) {
		Assert.assertEquals(productType, product.getProductType());
	}

	/**
	 * Validate :: S C O R E
	 */

	@Then("^the complete score is (\\s*|-?[0-9.]+)$")
	public void validateScore(Integer score) {
		Assert.assertEquals(score, scores.get(0).getScore());
	}

	@Then("^the complete service level is (\\s*|-?[0-9.]+)$")
	public void validateServiceLevel(Integer servicelLevel) {
		Assert.assertEquals(servicelLevel, scores.get(0).getServiceLevel());
	}

	/**
	 * Validate :: M A I N T E N A N C E
	 */

	@Then("^the complete maintenance PM is (\\s*|-?[0-9.]+)$")
	public void validateMaintenancePm(Integer pm) {
		Assert.assertEquals(pm, maintenances.get(0).getPm());
	}

	@Then("^the complete maintenance PM/D is (\\s*|-?[0-9.]+)$")
	public void validateMaintenancePmd(Integer pmd) {
		Assert.assertEquals(pmd, maintenances.get(0).getPmd());
	}

	@Then("^the complete maintenance IM is (\\s*|-?[0-9.]+)$")
	public void validateMaintenanceIm(Integer im) {
		Assert.assertEquals(im, maintenances.get(0).getIm());
	}

	@Then("^the complete maintenance PT is (\\s*|-?[0-9.]+)$")
	public void validateMaintenancePt(Integer pt) {
		Assert.assertEquals(pt, maintenances.get(0).getPt());
	}

	@Then("^the complete maintenance PM/MMR is (\\s*|-?[0-9.]+)$")
	public void validateMaintenancePmMmr(Integer pmMmr) {
		Assert.assertEquals(pmMmr, maintenances.get(0).getPmMmr());
	}

	@Then("^the complete maintenance CAT1 is (\\s*|-?[0-9.]+)$")
	public void validateMaintenanceCat1(Integer cat1) {
		Assert.assertEquals(cat1, maintenances.get(0).getCat1());
	}

	/**
	 * Validate :: D U R A T I O N
	 */

	@Then("^the complete duration PM is (\\s*|-?[0-9.]+)$")
	public void validateDurationPm(Double pm) {
		Assert.assertEquals(pm, durations.get(0).getPm());
	}

	@Then("^the complete duration PM/D is (\\s*|-?[0-9.]+)$")
	public void validateDurationPmd(Double pmd) {
		Assert.assertEquals(pmd, durations.get(0).getPmd());
	}

	@Then("^the complete duration IM is (\\s*|-?[0-9.]+)$")
	public void validateDurationIm(Double im) {
		Assert.assertEquals(im, durations.get(0).getIm());
	}

	@Then("^the complete duration PT is (\\s*|-?[0-9.]+)$")
	public void validateDurationPt(Double pt) {
		Assert.assertEquals(pt, durations.get(0).getPt());
	}

	@Then("^the complete duration PM/MMR is (\\s*|-?[0-9.]+)$")
	public void validateDurationPmMmr(Double pmMmr) {
		Assert.assertEquals(pmMmr, durations.get(0).getPmMmr());
	}

	@Then("^the complete duration CAT1 is (\\s*|-?[0-9.]+)$")
	public void validateDurationCat1(Double cat1) {
		Assert.assertEquals(cat1, durations.get(0).getCat1());
	}

	/**
	 * Validate :: B R O N Z E (Maintenance and Duration)
	 */

	@Then("^bronze status should be (\\S+)$")
	public void validateStatus(Boolean status) {
		Assert.assertEquals(status, bronze.getIsBronze());
	}

	@Then("the bronze duration im-sla is (\\S*)$")
	public void validBronzeDuration(Double imSla) {
		Assert.assertEquals(imSla, durations.get(0).getImSla());
	}

	@Then("the bronze duration im is (\\S*)$")
	public void validBronzeDurationIm(Double im) {
		Assert.assertEquals(im, durations.get(0).getIm());
	}

	@Then("the bronze maintenance im-sla is (\\S*)$")
	public void validBronzeMaintenance(Integer imSla) {
		Assert.assertEquals(imSla, maintenances.get(0).getImSla());
	}

}
