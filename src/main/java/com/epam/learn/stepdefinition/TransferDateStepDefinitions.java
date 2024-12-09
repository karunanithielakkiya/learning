package com.epam.learn.stepdefinition;

import com.epam.learn.pages.TransferDatePage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class TransferDateStepDefinitions {
    WebDriver driver;
    TransferDatePage transferDatePage;

    @Given("the user is logged into the system")
    public void theUserIsLoggedIntoTheSystem() {
        // Assume user is logged in
    }

    @Given("the user navigates to the transfer date selection screen")
    public void theUserNavigatesToTheTransferDateSelectionScreen() {
        driver = new ChromeDriver();
        transferDatePage = new TransferDatePage(driver);
        // Navigate to the transfer date selection screen
    }

    @When("the user selects a date within 6 months from the current date")
    public void theUserSelectsAValidDate() {
        transferDatePage.selectDate("2023-12-01"); // Example date
    }

    @Then("the selected date is accepted")
    public void theSelectedDateIsAccepted() {
        Assert.assertTrue("Date should be accepted", transferDatePage.getErrorMessage().isEmpty());
    }

    @Then("no error message is displayed")
    public void noErrorMessageIsDisplayed() {
        Assert.assertTrue("No error message should be displayed", transferDatePage.getErrorMessage().isEmpty());
    }

    @When("the user attempts to select a past date")
    public void theUserAttemptsToSelectAPastDate() {
        transferDatePage.selectDate("2022-01-01"); // Example past date
    }

    @Then("the system displays an error message indicating that past dates cannot be selected")
    public void theSystemDisplaysAnErrorMessageForPastDates() {
        Assert.assertEquals("Past dates cannot be selected", transferDatePage.getErrorMessage());
    }

    @When("the user attempts to select a weekend date")
    public void theUserAttemptsToSelectAWeekendDate() {
        transferDatePage.selectDate("2023-12-02"); // Example weekend date
    }

    @Then("the system displays an error message indicating that weekends cannot be selected")
    public void theSystemDisplaysAnErrorMessageForWeekendDates() {
        Assert.assertEquals("Weekends cannot be selected", transferDatePage.getErrorMessage());
    }

    @When("the user attempts to select a holiday date")
    public void theUserAttemptsToSelectAHolidayDate() {
        transferDatePage.selectDate("2023-12-25"); // Example holiday date
    }

    @Then("the system displays an error message indicating that holidays cannot be selected")
    public void theSystemDisplaysAnErrorMessageForHolidayDates() {
        Assert.assertEquals("Holidays cannot be selected", transferDatePage.getErrorMessage());
    }
}
