package com.tke.servicesight.rules.cucumber.steps;

import java.util.UUID;

import org.junit.Assert;

import com.tke.servicesight.rules.model.Product;
import com.tke.servicesight.rules.service.BRMSService;
import com.tke.servicesight.rules.service.Processes;
import com.tke.servicesight.rules.service.Queries;

import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

/**
 * Define cucumber steps for Product Types.
 *
 * @author Sunil Samuel (sunil@redhat.com)
 * @author Christian Witchger (cwitchger@redhat.com)
 *
 */
public class ProductTypeSteps {
	/**
	 * These objects are used as input (facts) into the BRMS engine
	 */
	private Product product;

	/**
	 * These objects are the results of the rules.
	 */
	private BRMSService service = new BRMSService();

	@Before
	public void initialize() {
		UUID id = UUID.randomUUID();
		product = new Product();
		product.setId(id.toString());
	}

	@Given(value = "^a TKE unit type ([a-zA-Z0-9-]+)$")
	public void calculateServiceLevelGivenProductTypeAndScore(String unitType) {
		product.setUnitType(unitType);
	}

	@Then(value = "^the product type is ([a-zA-Z0-9-]+)$")
	public void validateProductType(String productType) {
		service.initializeProcess(Processes.Score, product);
		service.query(Queries.Score);
		service.executeRules();
		Assert.assertEquals(productType, product.getProductType());
	}
}
