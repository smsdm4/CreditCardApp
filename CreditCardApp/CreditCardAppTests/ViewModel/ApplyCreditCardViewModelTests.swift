//
//  ApplyCreditCardViewModelTests.swift
//  CreditCardAppTests
//
//  Created by Mojtaba Mirzadeh on 8/29/22.
//

import XCTest
@testable import CreditCardApp

class when_credit_card_is_denied_due_to_age: XCTestCase {

    func test_should_set_under_age_message_succesfully(){
     
        let applyCreditCardViewModel = ApplyCreditCardViewModel()
        applyCreditCardViewModel.name = "Mojtaba Mirzadeh"
        applyCreditCardViewModel.ssn = "123-00-1306"
        applyCreditCardViewModel.dob = "08/16/2008"
        
        applyCreditCardViewModel.apply()
        
        XCTAssertEqual(applyCreditCardViewModel.message, "Denied; UnderAge")
        
    }

}
