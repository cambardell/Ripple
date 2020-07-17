//
//  SettingsView.swift
//  Ripple
//
//  Created by Cameron Bardell on 6/29/20.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @State var attributeText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Settings")
                .modifier(headingText())
                .padding()
          
            TextField("Specific attribute", text: $attributeText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                let url: NSURL = URL(string: "https://cambardell.github.io")! as NSURL
                UIApplication.shared.open(url as URL)
            }) {
                Text("Made by Cameron Bardell")
                    .foregroundColor(.rippleOrange)
                    .underline()
                    .padding()
            }
            
            Button(action: {
                let url: NSURL = URL(string: "https://annabellehartwich.myportfolio.cp,")! as NSURL
                UIApplication.shared.open(url as URL)
            }) {
                Text("With design help from Annabelle Hartwich")
                    .foregroundColor(.rippleOrange)
                    .underline()
                    .padding([.horizontal, .bottom])
            }

            
            
        }.padding()
        .background(
            
            Rectangle()
                .opacity(0.03)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
        )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


