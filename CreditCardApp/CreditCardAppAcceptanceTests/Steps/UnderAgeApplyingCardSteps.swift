//
//  UnderAgeApplyingCardSteps.swift
//  CreditCardAppAcceptanceTests
//
//  Created by Mojtaba Mirzadeh on 8/29/22.
//

import Foundation
import Cucumberish
import XCTest

class UnderAgeApplyingCardSteps {
    
    func run() {
        
        Given("the following user information") { arg, userInfo in
            XCUIApplication().launch()
            
            let rows: NSArray = userInfo?["DataTable"] as! NSArray
            
            for index in 1..<rows.count {
             let data = rows[index] as! NSArray
                
                let name = data[0] as! String
                let ssn = data[1] as! String
                let dob = data[2] as! String
                
                let nameTextField = XCUIApplication().textFields["nameTetField"]
                nameTextField.tap()
                nameTextField.typeText(name + "\n")
                
                let ssnTextField = XCUIApplication().textFields["ssnTetField"]
                ssnTextField.tap()
                ssnTextField.typeText(ssn + "\n")
                
                let dobTextField = XCUIApplication().textFields["dobTetField"]
                dobTextField.tap()
                dobTextField.typeText(dob + "\n")
                
            }
            
        }
        
        When("user press the apply button") { _, _ in
            XCUIApplication().buttons["applyButton"].tap()
        }
        
        Then("user should get a rejection message") { _, _ in
            let messageLabel = XCUIApplication().staticTexts["messageLabel"]
            XCTAssertEqual("Denied; Underage", messageLabel.label)
        }
        
    }
    
}
