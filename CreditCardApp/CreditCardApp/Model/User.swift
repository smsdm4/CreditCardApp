//
//  User.swift
//  CreditCardApp
//
//  Created by Mojtaba Mirzadeh on 8/31/22.
//

import Foundation

class User {
    
    var name: String
    var ssn: String
    var dob: Date
    
    init(name: String, ssn: String, dob: Date) {
        self.name = name
        self.ssn = ssn
        self.dob = dob
    }
    
}

extension User {
    var isEligible: Bool {
        let components = Calendar.current.dateComponents([.year], from: self.dob, to: Date())
        if let year = components.year {
            return year >= 18
        }
        return false
    }
}


