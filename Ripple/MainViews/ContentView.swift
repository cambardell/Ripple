//
//  ContentView.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-03-30.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var week: currentWeek
    @State var currentPage = 0
    @State var reportButtonsOffset = 500
    
    var body: some View {
        
        
        VStack {
            
            VStack {
                LogCard(color: .rippleYellow, barColor: .rippleBlue, title: "Morning Log", expand: true)
                
                LogCard(color: .rippleBlue, barColor: .rippleYellow, title: "Afternoon Log", expand: true)
            }
            
            Spacer()
            HStack {
                Button(action: {
                    print("chart")
                }) {
                    Image(systemName: "gear")
                        .resizable()
                        .foregroundColor(.rippleDarkBlue)
                        .frame(width: 40, height: 40)
                        .padding(.horizontal)
                }
                Spacer()
                
                Button(action: {
                    print("Weekly")
                }) {
                    Text("Weekly")
                        .foregroundColor(.black)
                        .padding(8)
                        .background(Color.rippleGreen)
                        .cornerRadius(8)
                }.offset(x: CGFloat(self.reportButtonsOffset))
                Button(action: {
                    print("Monthly")
                }) {
                    Text("Monthly")
                        .foregroundColor(.black)
                        .padding(8)
                        .background(Color.rippleGreen)
                        .cornerRadius(8)
                }.offset(x: CGFloat(self.reportButtonsOffset))
                
                Button(action: {
                    withAnimation(.spring(response: 0.2, dampingFraction: 0.6, blendDuration: 0.2)) {
                        if self.reportButtonsOffset == 0 {
                            self.reportButtonsOffset = 500
                        } else {
                            self.reportButtonsOffset = 0
                        }
                    }
                }) {
                    Image(systemName: "chart.bar.fill")
                        .resizable()
                        .foregroundColor(.rippleDarkBlue)
                        .frame(width: 40, height: 40)
                        .padding(.horizontal)
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(currentWeek())
    }
}

