//
//  CucumberishInitializer.swift
//  CreditCardAppAcceptanceTests
//
//  Created by Mojtaba Mirzadeh on 8/29/22.
//

import Foundation
import Cucumberish

class CucumberishInitializer: NSObject {
    
    @objc class func setupCucumberish() {
        
        let underAgeApplyingCardSteps = UnderAgeApplyingCardSteps()
        
        before({ _ in
            
            underAgeApplyingCardSteps.run()
            
        })
        
        let bundle = Bundle(for: CucumberishInitializer.self)
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
        
    }
    
}
