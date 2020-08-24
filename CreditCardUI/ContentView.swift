//
//  ContentView.swift
//  CreditCardUI
//
//  Created by Ankit Jaiswal on 24/08/20.
//  Copyright © 2020 Ankit Jaiswal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var degress: Double = 0
    @State private var isFlipped: Bool  = false
    @State private var name: String  = ""
    @State private var date: String  = ""
    @State private var cvv: String  = ""
    
    var body: some View {
        VStack {
            CreditCard {
                VStack {
                    Group {
                        if self.isFlipped {
                            CreditCardBack(cvv: self.cvv)
                        } else {
                            CreditCardFront(name: self.name, expiration: self.date)
                        }
                    }
                }.rotation3DEffect(.degrees(self.degress), axis: (x: 0, y: 1.0, z: 0))
            }.onTapGesture {
                withAnimation {
                    self.degress += 180
                    self.isFlipped.toggle()
                }
            }
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
            TextField("Expiry Date", text: $date)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
            TextField("CVV", text: $cvv, onEditingChanged: {(editingChanged) in
                withAnimation {
                    self.degress += 180
                    self.isFlipped.toggle()
                }
            } )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
