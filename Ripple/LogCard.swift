//
//  LogCard.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-04-08.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct LogCard: View {
    var color: Color
    var width: CGFloat
    var height: CGFloat
    @State var expand = false
    @State var text = ""
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Log Title").font(.title)
                Spacer()
                Button(action: {
                    withAnimation {
                       self.expand.toggle()
                    }
                    
                }) {
                    Image(systemName: expand ? "arrow.down.left" : "arrow.up.right")
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                }
            }
            Divider()
            Text("Tap to expand / edit")
            if expand {
                TextView(text: self.$text, placeholder: "Edit the text here")
                .cornerRadius(5)
                .padding()
            
                
            }
            Spacer()
        }.frame(width: self.width - 50, height: expand ? self.height / 2 : 150)
            .background(self.color)
            .cornerRadius(10)
            .shadow(radius: 10)
           
    }
}

struct LogCard_Previews: PreviewProvider {
    static var previews: some View {
        LogCard(color: .rippleYellow, width: 400, height: 734)
    }
}
