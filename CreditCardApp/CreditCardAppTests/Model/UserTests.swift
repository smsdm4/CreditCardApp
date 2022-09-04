//
//  UserTests.swift
//  CreditCardAppTests
//
//  Created by Mojtaba Mirzadeh on 8/31/22.
//

import XCTest
@testable import CreditCardApp

class when_18_or_above_user_applies_for_credit_card: XCTestCase {

    func test_sould_make_sure_user_is_eligible() {
        
        let dob = Calendar.current.date(byAdding: .year, value: -20, to: Date())
        let user = User(name: "Mojtaba Mirzadeh", ssn: "123-00-1306", dob: dob!)
        
        XCTAssertTrue(user.isEligible)
        
    }

}

class when_a_user_less_than_18_years_apply_for_credit_car: XCTestCase {
    
    func test_sould_make_sure_user_is_not_eligible() {
        
        let dob = Calendar.current.date(byAdding: .year, value: -10, to: Date())
        let user = User(name: "Mojtaba Mirzadeh", ssn: "123-00-1306", dob: dob!)
        
        XCTAssertFalse(user.isEligible)
        
    }
    
}
