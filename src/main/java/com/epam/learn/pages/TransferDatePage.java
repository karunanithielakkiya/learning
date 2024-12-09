package com.epam.learn.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class TransferDatePage {
    WebDriver driver;

    @FindBy(id = "datePicker")
    private WebElement datePicker;

    @FindBy(id = "errorMessage")
    private WebElement errorMessage;

    public TransferDatePage(WebDriver driver) {
        this.driver = driver;
        PageFactory.initElements(driver, this);
    }

    public void selectDate(String date) {
        datePicker.sendKeys(date);
    }

    public String getErrorMessage() {
        return errorMessage.getText();
    }
}