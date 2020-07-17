//
//  ContentView.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-03-30.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var logData: LogData
    
    @State var currentPage = 0
    @State var reportButtonsOffset = 500
    
    @State var showListTest = false
    
    @State var morningLogCompleted: Bool
    @State var afternoonLogCompleted: Bool
    
    var body: some View {
        
        VStack {
            
            VStack {
                if morningLogCompleted {
                    LogCompleteCard(morning: true, color: .rippleYellow)
                } else {
                    LogCard(color: .rippleYellow, barColor: .rippleBlue, title: "Morning Log", morning: true, expand: true, logCompleted: $morningLogCompleted).environment(\.managedObjectContext, self.managedObjectContext)
                }
                if afternoonLogCompleted {
                    LogCompleteCard(morning: false, color: .rippleBlue)
                } else {
                    LogCard(color: .rippleBlue, barColor: .rippleYellow, title: "Afternoon Log", morning: false, expand: true, logCompleted: $afternoonLogCompleted).environment(\.managedObjectContext, self.managedObjectContext)

                }
                
            }
            
            Spacer()
            HStack {
                Button(action: {
                    self.showListTest.toggle()
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
        }.sheet(isPresented: $showListTest) {
            ListTestView().environment(\.managedObjectContext, self.managedObjectContext).environmentObject(self.logData)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(morningLogCompleted: false, afternoonLogCompleted: false).environmentObject(currentWeek())
    }
}

