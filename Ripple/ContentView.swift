//
//  ContentView.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-03-30.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                VStack {
                    CalendarTab()
                    
                    Text("Today's Logs").font(.largeTitle)
                        .padding()
                    
                    Spacer()
                    Divider()
                        .padding(.bottom)
                    
                    HStack(spacing: 40) {
                        BottomButton(image: "plus.circle.fill", text: "Add")
                        BottomButton(image: "ellipsis.circle.fill", text: "Strategies")
                        BottomButton(image: "book.circle.fill", text: "Log")
                    }
                }.edgesIgnoringSafeArea(.top)
                
                // Testing a card interface. Probably more appropriate when giving strategy suggestions. 
                    LogCard(color: .rippleOrange, width: geometry.size.width, height: geometry.size.height)
                        
                        .offset(x: self.offset.width / 3, y: self.offset.height / 3)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    self.offset = gesture.translation
                                    print("drag")
                            }
                                
                            .onEnded { _ in
                                if (pow(self.offset.width, 2) + pow(self.offset.width, 2)).squareRoot() > 100 {
                                    print("move")
                                    withAnimation {
                                        self.offset = .zero
                                    }
                                    
                                }
                                withAnimation {
                                   self.offset = .zero
                                }
                                
                        })
            }
        }
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
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.rippleDarkBlue)
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
    var width: CGFloat
    var height: CGFloat
    @State var expand = false
    var body: some View {
        VStack {
            Text("Log Title").font(.largeTitle)
                .foregroundColor(.rippleDarkBlue)
            Text("Tap to expand / edit")
                .foregroundColor(.rippleDarkBlue)
            
            Spacer()
        }.frame(width: expand ? self.width - 50 : 200, height: expand ? self.height - 50 : 300)
            .background(self.color)
            .cornerRadius(10)
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation {
                    self.expand.toggle()
                }
                
        }
        
        
    }
}

struct BottomButton: View {
    var image: String
    var text: String
    var body: some View {
        VStack {
            Button(action: {
                print("button pressed")
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

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}
