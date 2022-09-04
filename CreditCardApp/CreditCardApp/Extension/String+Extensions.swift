//
//  String+Extensions.swift
//  CreditCardApp
//
//  Created by Mojtaba Mirzadeh on 8/31/22.
//

import Foundation

extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.date(from: self)!
    }
}
