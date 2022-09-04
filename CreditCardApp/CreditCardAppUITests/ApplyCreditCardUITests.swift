//
//  ApplyCreditCardUITests.swift
//  CreditCardAppUITests
//
//  Created by Mojtaba Mirzadeh on 8/29/22.
//

import XCTest

class when_under_18_user_applies_for_credit_card: XCTestCase {

    // MARK: - Properties
    private var applyCreditCardPage: ApplyCreditCardPage!
    
    // MARK: - LifeCycles
    override func setUp() {
        super.setUp()
        self.applyCreditCardPage = ApplyCreditCardPage()
        self.applyCreditCardPage.launch()
    }
    
    // MARK: - Tests
    func test_should_see_a_denied_message_on_the_screen() {
        
        self.applyCreditCardPage.typeInName("Mojtaba Mirzadeh")
        
        self.applyCreditCardPage.typeInSsn("123-00-1306")
        
        self.applyCreditCardPage.typeInDob("08/16/2008")
        
        self.applyCreditCardPage.tapApplyButton()
        
        XCTAssertEqual("Denied; UnderAge", self.applyCreditCardPage.messageText)
        
    }
    
}
