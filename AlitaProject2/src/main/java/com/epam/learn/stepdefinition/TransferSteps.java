package com.example.automation;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;

public class TransferSteps extends BaseStep {

    private TransferPage transferPage;

    @Given("I am logged into the system")
    public void iAmLoggedIntoTheSystem() {
        // Assume login is handled elsewhere
        transferPage = new TransferPage(driver);
    }

    @When("I navigate to the transfer section")
    public void iNavigateToTheTransferSection() {
        transferPage.navigateToTransferSection();
    }

    @Then("I should see the transfer frequency selection screen")
    public void iShouldSeeTheTransferFrequencySelectionScreen() {
        Assert.assertTrue(transferPage.isFrequencySelectionScreenVisible());
    }

    @When("I am on the transfer frequency selection screen")
    public void iAmOnTheTransferFrequencySelectionScreen() {
        Assert.assertTrue(transferPage.isFrequencySelectionScreenVisible());
    }

    @And("I view the available transfer frequency options")
    public void iViewTheAvailableTransferFrequencyOptions() {
        // No action needed, just a logical step
    }

    @Then("I should see only the one-time transfer option")
    public void iShouldSeeOnlyTheOneTimeTransferOption() {
        Assert.assertTrue(transferPage.isOneTimeOptionVisible());
    }

    @And("I attempt to select a recurring transfer option")
    public void iAttemptToSelectARecurringTransferOption() {
        Assert.assertFalse(transferPage.isRecurringOptionSelectable());
    }

    @Then("I should not be able to select it")
    public void iShouldNotBeAbleToSelectIt() {
        Assert.assertFalse(transferPage.isRecurringOptionSelectable());
    }

    @And("I should receive a message indicating that recurring transfers are not available")
    public void iShouldReceiveAMessageIndicatingThatRecurringTransfersAreNotAvailable() {
        Assert.assertEquals("Recurring transfers are not available", transferPage.getErrorMessage());
    }

    @When("I select the one-time transfer option")
    public void iSelectTheOneTimeTransferOption() {
        transferPage.selectOneTimeOption();
    }

    @And("I confirm the selection")
    public void iConfirmTheSelection() {
        transferPage.confirmSelection();
    }

    @Then("the one-time transfer option should be successfully selected and confirmed")
    public void theOneTimeTransferOptionShouldBeSuccessfullySelectedAndConfirmed() {
        Assert.assertEquals("One-time transfer option selected", transferPage.getConfirmationMessage());
    }

    @And("I should receive a confirmation message")
    public void iShouldReceiveAConfirmationMessage() {
        Assert.assertEquals("Transfer confirmed", transferPage.getConfirmationMessage());
    }
}
