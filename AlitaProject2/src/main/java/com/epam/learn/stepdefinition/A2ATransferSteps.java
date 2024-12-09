package com.epam.learn.stepdefinition;

import com.epam.learn.pages.A2ATransferPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class A2ATransferSteps {

    private WebDriver driver;
    private A2ATransferPage a2aTransferPage;

    public A2ATransferSteps() {
        driver = new ChromeDriver();
        a2aTransferPage = new A2ATransferPage(driver);
    }

    @When("the user enters valid FROM account details {string}")
    public void theUserEntersValidFROMAccountDetails(String fromAccount) {
        a2aTransferPage.enterFromAccountDetails(fromAccount);
    }

    @And("the user enters valid TO account details {string}")
    public void theUserEntersValidTOAccountDetails(String toAccount) {
        a2aTransferPage.enterToAccountDetails(toAccount);
    }

    @And("the user initiates the transfer")
    public void theUserInitiatesTheTransfer() {
        a2aTransferPage.initiateTransfer();
    }

    @Then("the system should validate the account details")
    public void theSystemShouldValidateTheAccountDetails() {
        // Assume validation is done within the application
    }

    @And("the transfer should be initiated successfully")
    public void theTransferShouldBeInitiatedSuccessfully() {
        String confirmation = a2aTransferPage.getConfirmationMessage();
        Assert.assertEquals("Transfer initiated successfully", confirmation);
    }

    @And("a confirmation message {string} should be displayed")
    public void aConfirmationMessageShouldBeDisplayed(String expectedMessage) {
        String actualMessage = a2aTransferPage.getConfirmationMessage();
        Assert.assertEquals(expectedMessage, actualMessage);
    }

    @When("the user enters FROM account details {string}")
    public void theUserEntersFROMAccountDetails(String fromAccount) {
        a2aTransferPage.enterFromAccountDetails(fromAccount);
    }

    @And("the user enters TO account details {string}")
    public void theUserEntersTOAccountDetails(String toAccount) {
        a2aTransferPage.enterToAccountDetails(toAccount);
    }

    @Then("an error message {string} should be displayed")
    public void anErrorMessageShouldBeDisplayed(String expectedErrorMessage) {
        String actualErrorMessage = a2aTransferPage.getErrorMessage();
        Assert.assertEquals(expectedErrorMessage, actualErrorMessage);
    }
}