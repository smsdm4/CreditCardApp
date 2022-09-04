//
//  ApplyCreditCardViewModel.swift
//  CreditCardApp
//
//  Created by Mojtaba Mirzadeh on 8/31/22.
//

import Foundation

class ApplyCreditCardViewModel: ObservableObject {
    
    @Published var service: CreditScoreServiceProtocol
    
    @Published var name: String = ""
    @Published var ssn: String = ""
    @Published var dob: String = ""
    @Published var message: String = ""
    
    private var user: User {
        return User(name: self.name, ssn: self.ssn, dob: self.dob.toDate())
    }
    
    init(service: CreditScoreServiceProtocol) {
        self.service = service
    }
    
    func apply() {

        if !user.isEligible {
            self.message = "Denied; UnderAge"
        }
        
        let creditCard = CreditCard(user: self.user)
        creditCard.calculateAPR(service: self.service) {
            DispatchQueue.main.async {
                if let apr = creditCard.apr {
                    self.message = "\(apr)%"
                }
            }
        }
        
    }
    
}
