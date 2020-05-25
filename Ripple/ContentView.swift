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
                
                CalendarTab().padding(.top)
                    .background(Color.rippleBlue)
                Text("Today's Logs").font(.custom("AbrilFatface-Regular", size: 30))
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        LogCard(color: .rippleYellow, width: geometry.size.width, height: geometry.size.height)
                        
                        
                        LogCard(color: .rippleOrange, width: geometry.size.width, height: geometry.size.height)
                        
                      
                    }
                    Spacer()
                }

                Spacer()
                
                Button(action: {
                    print("Show mood chart")
                }) {
                    Text("View Chart")
                        .font(.headline)
                        .foregroundColor(.rippleDarkGreen)
                        .padding()
                        .overlay(
                            Capsule()
                                .stroke(lineWidth: 5)
                                .foregroundColor(.rippleDarkGreen)
                            
                        )
                }
                
//                HStack(spacing: 40) {
//                    BottomButton(toggle: self.$presentAddLog, image: "plus.circle.fill", text: "Add")
//                    BottomButton(toggle: self.$presentAddLog, image: "ellipsis.circle.fill", text: "Strategies")
//                    BottomButton(toggle: self.$presentAddLog, image: "book.circle.fill", text: "Log")
//                }
            }.edgesIgnoringSafeArea(.top)
            
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
    let weekList = ["S", "M", "T", "W", "T", "F", "S"]
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("Month")
                    .font(.custom("AbrilFatface-Regular", size: 40))
                    .fontWeight(.bold)
                    
                WeekRow(days: weekList)
                
            }
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

struct WeekRow: View {
    let days: [String]
    @State var selected = false
    var body: some View {
        HStack {
            ForEach(days, id: \.self) { day in
                Capsule()
                    .fill(Color.rippleGreen)
                    .shadow(radius: 5)
                    .frame(width: 35, height: 35)
                    .hidden()
                    .overlay(Text(day))
                    .padding([.leading, .trailing], 5)
                
            }
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
