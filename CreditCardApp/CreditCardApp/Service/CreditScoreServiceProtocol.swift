//
//  CreditScoreServiceProtocol.swift
//  CreditCardApp
//
//  Created by Mojtaba Mirzadeh on 9/4/22.
//

import Foundation

protocol CreditScoreServiceProtocol {
    
    func getCreditScore(user: User, completion: @escaping (CreditScore?) -> Void)
    
}
