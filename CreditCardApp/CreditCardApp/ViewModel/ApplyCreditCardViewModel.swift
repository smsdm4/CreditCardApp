//
//  ApplyCreditCardViewModel.swift
//  CreditCardApp
//
//  Created by Mojtaba Mirzadeh on 8/31/22.
//

import Foundation

class ApplyCreditCardViewModel: ObservableObject {
    
    var name: String = ""
    var ssn: String = ""
    var dob: String = ""
    @Published var message: String = ""
    
    private var user: User {
        return User(name: self.name, ssn: self.ssn, dob: self.dob.toDate())
    }
    
    func apply() {
        
        print(self.dob.toDate())
        print(self.message)
        
        if !user.isEligible {
            self.message = "Denied; UnderAge"
        }
        
    }
    
}
