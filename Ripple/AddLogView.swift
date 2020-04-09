//
//  AddLogView.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-04-04.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct AddLogView: View {
    @State var text = ""
    @State var stratWorked = 0
    var body: some View {
        VStack(alignment: .center) {
            Text("Add a log").font(.largeTitle)
                .padding()
            TextField("Add some text", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text("Strategy picker here")
                .padding(50)
                .overlay(
                    Capsule()
                        .stroke()
            )
            Text("Rate the strategy used")
                .padding(.top)
            starStack(stratWorked: $stratWorked)
            Spacer()
        }
    }
}

struct AddLogView_Previews: PreviewProvider {
    static var previews: some View {
        AddLogView()
    }
}

struct starStack: View {
    @Binding var stratWorked: Int 
    var body: some View {
        HStack {
            ForEach((1...5), id: \.self) { number in
                Button(action: {self.stratWorked = number}) {

                    Image(systemName: self.stratWorked == number ? "\(String(number)).circle.fill" : "\(String(number)).circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.rippleGreen)
                        .font(Font.title.weight(.thin))
                    
                }
            }
            
            
        }
    }
}
