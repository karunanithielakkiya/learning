package com.epam.learn.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class A2ATransferPage {

    WebDriver driver;

    @FindBy(id = "fromAccount")
    private WebElement fromAccountInput;

    @FindBy(id = "toAccount")
    private WebElement toAccountInput;

    @FindBy(id = "initiateTransfer")
    private WebElement initiateTransferButton;

    @FindBy(id = "confirmationMessage")
    private WebElement confirmationMessage;

    @FindBy(id = "errorMessage")
    private WebElement errorMessage;

    public A2ATransferPage(WebDriver driver) {
        this.driver = driver;
        PageFactory.initElements(driver, this);
    }

    public void enterFromAccountDetails(String fromAccount) {
        fromAccountInput.clear();
        fromAccountInput.sendKeys(fromAccount);
    }

    public void enterToAccountDetails(String toAccount) {
        toAccountInput.clear();
        toAccountInput.sendKeys(toAccount);
    }

    public void initiateTransfer() {
        initiateTransferButton.click();
    }

    public String getConfirmationMessage() {
        return confirmationMessage.getText();
    }

    public String getErrorMessage() {
        return errorMessage.getText();
    }
}