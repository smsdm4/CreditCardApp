//
//  CreditScoreService.swift
//  CreditCardApp
//
//  Created by Mojtaba Mirzadeh on 9/4/22.
//

import Foundation

class CreditScoreService: CreditScoreServiceProtocol {
 
    func getCreditScore(user: User, completion: @escaping (CreditScore?) -> Void) {
        
        guard let url = URL(string: "https://hissing-polarized-starfish.glitch.me/credit-score") else {
            fatalError("URL is not valid")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(["ssn": user.ssn])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(nil)
            }
            
            let creditScore = try? JSONDecoder().decode(CreditScore.self, from: data)
            completion(creditScore)
            
        }.resume()
        
    }
    
}
