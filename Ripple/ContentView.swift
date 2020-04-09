//
//  ContentView.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-03-30.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var presentAddLog = false
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                CalendarTab()
                ScrollView(.vertical) {
                    HStack {
                        Spacer()
                        VStack(spacing: 10) {
                            LogCard(color: .rippleGreen, width: geometry.size.width, height: geometry.size.height)
                            LogCard(color: .rippleGreen, width: geometry.size.width, height: geometry.size.height)
                            LogCard(color: .rippleGreen, width: geometry.size.width, height: geometry.size.height)
                            LogCard(color: .rippleGreen, width: geometry.size.width, height: geometry.size.height)
                        }
                        Spacer()
                    }
                    
                }
                    
                Spacer()
                Divider()
                    .padding(.bottom)
                
                HStack(spacing: 40) {
                    BottomButton(toggle: self.$presentAddLog, image: "plus.circle.fill", text: "Add")
                    BottomButton(toggle: self.$presentAddLog, image: "ellipsis.circle.fill", text: "Strategies")
                    BottomButton(toggle: self.$presentAddLog, image: "book.circle.fill", text: "Log")
                }
            }.edgesIgnoringSafeArea(.top)
            
            // Testing a card interface. Probably more appropriate when giving strategy suggestions.
            
            
        }.sheet(isPresented: $presentAddLog) {
            AddLogView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalendarTab: View {
    
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 10) {
                Text("Month")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.rippleDarkBlue)
                
                MonthGrid(days: 30) { day in
                    Capsule()
                        .fill(Color.rippleYellow)
                        .shadow(radius: 5)
                        .frame(width: 35, height: 35)
                        .overlay(Text(String(day)))
                        .padding([.leading, .trailing], 5)
                       
                }
                
            }.padding(.top)
            Spacer()
            
        }.padding()
            .background(Color.rippleBlue)
        
    }
}



struct BottomButton: View {
    @Binding var toggle: Bool
    var image: String
    var text: String
    var body: some View {
        VStack {
            Button(action: {
                print("button pressed")
                self.toggle.toggle()
            }) {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.rippleDarkBlue)
                
            }
            Text(text)
        }
    }
}

struct MonthGrid<Content: View>: View {
    let days: Int
    let content: (Int) -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0 ..< (days / 7), id: \.self) { row in
                HStack {
                    ForEach(0 ..< 7, id: \.self) { column in
            
                        self.content(column + (row * 7) + 1)
                        
                    }
                }
            }
            HStack {
                if days % 7 >= 1 {
                    ForEach(1 ... (days % 7), id: \.self) { column in
                        self.content(7 * 4 + column)
                    }
                }
                
            }
        }
    }
    
    init(days: Int, @ViewBuilder content: @escaping (Int) -> Content) {
        self.days = days
        self.content = content
    }
}


extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}
