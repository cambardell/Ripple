//
//  LogCompleteCard.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-07-16.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct LogCompleteCard: View {
    var morning: Bool
    var color: Color
    var body: some View {
        VStack {
            Spacer()
            Text("Well done.")
                .modifier(headingText())
                
            if morning {
                Text("You completed this log already. Come back in the afternoon, or check your reports.")
                    .modifier(basicText())
                .padding()
            } else {
                Text("You completed this log already. Come back tomorrow, or check your reports.")
                    .modifier(basicText())
                .padding()
            }
            Spacer()
        }.padding()
        .background(
            Rectangle()
                .fill(self.color)
                .cornerRadius(10)
                .opacity(0.5)
                .padding()
                .shadow(radius: 5)
        )
        
    }
}

struct LogCompleteCard_Previews: PreviewProvider {
    static var previews: some View {
        LogCompleteCard(morning: true, color: .rippleBlue)
    }
}
