//
//  ApplyCreditCardUITests.swift
//  CreditCardAppUITests
//
//  Created by Mojtaba Mirzadeh on 8/29/22.
//

import XCTest

class when_under_18_user_applies_for_credit_card: XCTestCase {

    // MARK: - Properties
    private var app: XCUIApplication!
    
    // MARK: - LifeCycles
    override func setUp() {
        super.setUp()
        self.app = XCUIApplication()
        self.app.launch()
    }
    
    // MARK: - Tests
    func test_should_see_a_denied_message_on_the_screen() {
        
        let nameTextField = self.app.textFields["nameTetField"]
        nameTextField.tap()
        nameTextField.typeText("Mojtaba Mirzadeh" + "\n")
        
        let ssnTextField = self.app.textFields["ssnTetField"]
        ssnTextField.tap()
        ssnTextField.typeText("123-00-1306" + "\n")
        
        let dobTextField = self.app.textFields["dobTetField"]
        dobTextField.tap()
        dobTextField.typeText("08/16/2011" + "\n")
        
        self.app.buttons["applyButton"].tap()
        
        let messageLabel = self.app.staticTexts["messageLabel"]
        
        XCTAssertEqual("Denied; Underage", messageLabel.label)
        
    }
    
}
