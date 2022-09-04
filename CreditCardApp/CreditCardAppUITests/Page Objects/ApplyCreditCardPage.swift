//
//  ApplyCreditCardPage.swift
//  CreditCardAppUITests
//
//  Created by Mojtaba Mirzadeh on 9/4/22.
//

import Foundation
import XCTest

class ApplyCreditCardPage {
    
    func launch() {
        XCUIApplication().launch()
    }
    
    func typeInName(_ text: String) {
        let nameTextField = XCUIApplication().textFields["nameTextField"]
        nameTextField.tap()
        nameTextField.typeText(text + "\n")
    }
    
    func typeInSsn(_ text: String) {
        let ssnTextField = XCUIApplication().textFields["ssnTextField"]
        ssnTextField.tap()
        ssnTextField.typeText(text + "\n")
    }
    
    func typeInDob(_ text: String) {
        let dobTextField = XCUIApplication().textFields["dobTextField"]
        dobTextField.tap()
        dobTextField.typeText(text + "\n")
    }
    
    func tapApplyButton() {
        XCUIApplication().buttons["applyButton"].tap()
    }
    
    var messageText: String {
        let messageLabel = XCUIApplication().staticTexts["messageLabel"].label
        return messageLabel
    }
    
    var messageLabel: XCUIElement {
        let messageLabel = XCUIApplication().staticTexts["messageLabel"]
        return messageLabel
    }
    
}
