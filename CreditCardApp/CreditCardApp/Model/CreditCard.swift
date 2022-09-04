//
//  CreditCard.swift
//  CreditCardApp
//
//  Created by Mojtaba Mirzadeh on 9/4/22.
//

import Foundation

class CreditCard {
    var user: User
    var apr: Double?
    
    init(user: User) {
        self.user = user
    }
    
    func calculateAPR(service: CreditScoreServiceProtocol, completion: @escaping ()-> Void) {
        
        service.getCreditScore(user: self.user) { creditScore in
            
            if let creditScore = creditScore {
                
                switch creditScore.score {
                case  600..<700:
                    self.apr = 0.2
                case  700..<850:
                    self.apr = 0.06
                default:
                    self.apr = nil
                }
                
            }
            
        }
        
        completion()
        
    }
    
}
