package com.example.automation;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class TransferPage {

    WebDriver driver;

    @FindBy(id = "transferSection")
    private WebElement transferSection;

    @FindBy(id = "frequencySelectionScreen")
    private WebElement frequencySelectionScreen;

    @FindBy(id = "oneTimeOption")
    private WebElement oneTimeOption;

    @FindBy(id = "recurringOption")
    private WebElement recurringOption;

    @FindBy(id = "confirmButton")
    private WebElement confirmButton;

    @FindBy(id = "confirmationMessage")
    private WebElement confirmationMessage;

    @FindBy(id = "errorMessage")
    private WebElement errorMessage;

    public TransferPage(WebDriver driver) {
        this.driver = driver;
        PageFactory.initElements(driver, this);
    }

    public void navigateToTransferSection() {
        transferSection.click();
    }

    public boolean isFrequencySelectionScreenVisible() {
        return frequencySelectionScreen.isDisplayed();
    }

    public boolean isOneTimeOptionVisible() {
        return oneTimeOption.isDisplayed();
    }

    public boolean isRecurringOptionSelectable() {
        return recurringOption.isEnabled();
    }

    public void selectOneTimeOption() {
        oneTimeOption.click();
    }

    public void confirmSelection() {
        confirmButton.click();
    }

    public String getConfirmationMessage() {
        return confirmationMessage.getText();
    }

    public String getErrorMessage() {
        return errorMessage.getText();
    }
}
