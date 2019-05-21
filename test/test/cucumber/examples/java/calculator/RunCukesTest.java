package cucumber.examples.java.calculator;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = { "progress", "json:target/cucumber-report.json" }, features = "resources")
public class RunCukesTest {

}
