//
//  CreditCardTests.swift
//  CreditCardAppTests
//
//  Created by Mojtaba Mirzadeh on 9/4/22.
//

import XCTest
@testable import CreditCardApp

class when_calculating_apr_based_on_credit_score: XCTestCase {

    func test_should_calculate_apr_successfully() {
        
        let user = User(name: "Mojtaba Mirzadeh", ssn: "123-00-1306", dob: "08/16/1990".toDate())
        let card = CreditCard(user: user)
        
        let expectation = expectation(description: "Loading...")
        
        let service = MockCreditScoreService()
        
        card.calculateAPR(service: service) {
            XCTAssertEqual(0.06, card.apr)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
        
    }

}
