//
//  MockCreditScoreService.swift
//  CreditCardAppTests
//
//  Created by Mojtaba Mirzadeh on 9/4/22.
//

import Foundation
@testable import CreditCardApp

class MockCreditScoreService: CreditScoreServiceProtocol {
    
    func getCreditScore(user: User, completion: @escaping (CreditScore?) -> Void) {
        let creditScore = CreditScore(score: 750)
        completion(creditScore)
    }
    
}
