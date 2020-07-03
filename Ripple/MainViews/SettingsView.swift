//
//  SettingsView.swift
//  Ripple
//
//  Created by Cameron Bardell on 6/29/20.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Notifications")
                .modifier(basicText())
                .padding(.horizontal)
            Text("Specific Attribute")
                .modifier(basicText())
                .padding(.horizontal)
            Text("Social media likes, credit, Annabelle's info, etc.")
                .modifier(basicText())
                .padding(.horizontal)
            Text("Quick explanation of wellness logging, links to articles.")
                .modifier(basicText())
                .padding(.horizontal)
            Spacer()
        }
        .padding()
        .background(
            Rectangle()
                .fill(Color.rippleRed)
                .cornerRadius(10)
                .opacity(0.8)
                .padding()
                .shadow(radius: 5)
        )

        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


