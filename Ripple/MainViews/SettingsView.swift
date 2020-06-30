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
        VStack {
            Text("Notifications")
            Text("Specific Attribute")
            Text("Social media likes, credit, Annabelle's info, etc.")
            Text("Quick explanation of wellness logging, links to articles.")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
