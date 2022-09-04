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
    
    // MARK: - Helpers
    func run() {
        
        let applyCreditCardPage = ApplyCreditCardPage()
        
        Given("the following user information") { arg, userInfo in
            
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
        
        When("user press the apply button") { _, _ in
            applyCreditCardPage.tapApplyButton()
        }
        
        Then("user should get a rejection message") { _, _ in
            XCTAssertEqual("Denied; UnderAge", applyCreditCardPage.messageText)
        }
        
    }
    
}
