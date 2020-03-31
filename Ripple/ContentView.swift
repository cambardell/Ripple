//
//  ContentView.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-03-30.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            CalendarTab()
            
            ScrollView(.horizontal) {
                HStack {
                    LogCard(color: .rippleOrange)
                    LogCard(color: .rippleYellow)
                    LogCard(color: .rippleGreen)
                }
            }
            Spacer()
        }.edgesIgnoringSafeArea(.top)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalendarTab: View {
    let days = ["S", "M", "T", "W", "T", "F", "S",]
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("Month")
                    .font(.title)
                    .padding()
                
                HStack(spacing: 30) {
                    ForEach(days, id: \.self) { day in
                       Text(day)
                    }
                    
                }
            }.padding(.top)
            Spacer()
            
        }.padding()
            .background(Color.rippleBlue)
            
    }
}

struct LogCard: View {
    var color: Color
    var body: some View {
        VStack {
            Text("Log Title").font(.largeTitle)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                .padding()
            Spacer()
        }.frame(width: 250, height: 350)
            .background(color)
            .cornerRadius(10)
            .padding()
            .shadow(radius: 10)
    }
}
