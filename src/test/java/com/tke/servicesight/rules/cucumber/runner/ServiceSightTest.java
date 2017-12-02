package com.tke.servicesight.rules.cucumber.runner;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(features = "classpath:cucumber-features", glue = "com/tke/servicesight/rules/cucumber/steps", plugin = {
		"pretty" }, monochrome = true, tags = { "~@Ignore" })
public class ServiceSightTest {

}
