//
//  CucumberishLoader.m
//  CreditCardAppAcceptanceTests
//
//  Created by Mojtaba Mirzadeh on 8/29/22.
//

#import <Foundation/Foundation.h>
#import "CreditCardAppAcceptanceTests-Swift.h"

__attribute__((constructor))
void CucumberishInit(){
    
    [CucumberishInitializer setupCucumberish];
}
