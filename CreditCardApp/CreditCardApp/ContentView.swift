//
//  ContentView.swift
//  CreditCardApp
//
//  Created by Mojtaba Mirzadeh on 8/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var applyCreditCardViewModel: ApplyCreditCardViewModel
    
    init(){
        self.applyCreditCardViewModel = ApplyCreditCardViewModel()
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                TextField("Enter name", text: self.$applyCreditCardViewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibility(identifier: "nameTetField")
                
                TextField("Enter ssn", text: self.$applyCreditCardViewModel.ssn)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibility(identifier: "ssnTetField")
                
                TextField("Enter date of birth", text: self.$applyCreditCardViewModel.dob)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibility(identifier: "dobTetField")
                
                Button("Apply") {
                    
                    self.applyCreditCardViewModel.apply()
                    
                }.padding(20)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .accessibility(identifier: "applyButton")
                
                Text(self.applyCreditCardViewModel.message)
                    .accessibility(identifier: "messageLabel")
                
                Spacer()
                
            }.padding()
            
            .navigationBarTitle("Apply for credit card")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
