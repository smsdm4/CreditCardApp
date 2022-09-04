//
//  ApplyCreditCardViewModelTests.swift
//  CreditCardAppTests
//
//  Created by Mojtaba Mirzadeh on 8/29/22.
//

import XCTest
import Combine
@testable import CreditCardApp

class when_credit_card_is_denied_due_to_age: XCTestCase {

    func test_should_set_under_age_message_succesfully(){
     
        let service = CreditScoreService()
        let applyCreditCardViewModel = ApplyCreditCardViewModel(service: service)
        
        applyCreditCardViewModel.name = "Mojtaba Mirzadeh"
        applyCreditCardViewModel.ssn = "123-00-1306"
        applyCreditCardViewModel.dob = "08/16/2008"
        
        applyCreditCardViewModel.apply()
        
        XCTAssertEqual(applyCreditCardViewModel.message, "Denied; UnderAge")
        
    }

}

class when_qualitified_user_apply_for_credit_card: XCTestCase {
    
    private var cancellable: AnyCancellable!
    
    func test_should_set_the_correct_apr_rate() {
        
        let expectation = expectation(description: "Loading...")
        
        let service = MockCreditScoreService()
        let applyCreditCardViewModel = ApplyCreditCardViewModel(service: service)
        
        applyCreditCardViewModel.name = "Mojtaba Mirzadeh"
        applyCreditCardViewModel.ssn = "123-00-1306"
        applyCreditCardViewModel.dob = "08/16/1990"
        
        applyCreditCardViewModel.apply()
        
        self.cancellable = applyCreditCardViewModel.$message.sink { text in
            if !text.isEmpty {
                XCTAssertEqual(text, "0.06%")
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
        
    }
    
}
