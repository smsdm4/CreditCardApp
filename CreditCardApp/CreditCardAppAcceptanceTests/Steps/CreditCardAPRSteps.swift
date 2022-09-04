//
//  CreditCardAPRSteps.swift
//  CreditCardAppAcceptanceTests
//
//  Created by Mojtaba Mirzadeh on 9/4/22.
//

import Foundation
import Cucumberish
import XCTest

class CreditCardAPRSteps {
    
    // MARK: - Helpers
    func run() {
        
        let applyCreditCardPage = ApplyCreditCardPage()
        
        Given("the following users applied for the credit card") { arg, userInfo in
            
            applyCreditCardPage.launch()
            
            let rows: NSArray = userInfo?["DataTable"] as! NSArray
            
            for index in 1..<rows.count {
             let data = rows[index] as! NSArray
                
                let name = data[0] as! String
                let ssn = data[1] as! String
                let dob = data[2] as! String
                
                applyCreditCardPage.typeInName(name)
                
                applyCreditCardPage.typeInSsn(ssn)
                
                applyCreditCardPage.typeInDob(dob)
                
            }
            
        }
        
        When("the user press the apply button") { _, _ in
            applyCreditCardPage.tapApplyButton()
        }
        
        Then("they should see the following APR rates") { _, userInfo in
            
            
            let rows: NSArray = userInfo?["DataTable"] as! NSArray
            
            for index in 1..<rows.count {
             let data = rows[index] as! NSArray
                
                let ssn = data[0] as! String
                let aprRate = data[1] as! String
                
                applyCreditCardPage.typeInSsn(ssn)
                
                //Compare the aprRate with messageLabel from the page Object
                let messageLabelVisible = applyCreditCardPage.messageLabel.waitForExistence(timeout: 5.0)
                
                if messageLabelVisible {
                    XCTAssertEqual(aprRate, applyCreditCardPage.messageLabel.label)
                }
                
            }
            
        }
        
    }
    
}
