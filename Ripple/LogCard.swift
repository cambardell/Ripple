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
    var title: String
    @State var overallWellness = 50.0
    @State var specificWellness = 50.0
    @State var expand: Bool
    @State var text = ""
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(title).font(.custom("JosefinSans-Light", size: 30))
                    .padding(.top)
                Spacer()
                
            }.onTapGesture {
                withAnimation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0.2)) {
                    self.expand.toggle()
                }
                
            }
            Divider()
            
            if expand {
                VStack {
                    HStack {
                        
                        Text("Rate your overall wellness:").font(.custom("Jost", size: 20)).padding(.horizontal)
                        Spacer()
                    }
                    HStack {
                        CustomSlider(value: $overallWellness, range: (0, 100), knobWidth: 0) { modifiers in
                            ZStack {
                                
                                LinearGradient(gradient: .init(colors: [Color.white, Color.white]), startPoint: .bottom, endPoint: .top)
                                
                                Group {
                                    LinearGradient(gradient: .init(colors: [Color.rippleBlue, Color.rippleOrange ]), startPoint: .leading, endPoint: .trailing)
                                    
                                }.modifier(modifiers.barLeft)
                                
                                Text(String(Int(self.overallWellness))).foregroundColor(.black)
                            }
                            
                            
                            .cornerRadius(8)
                        }
                        
                        
                        .frame(height: 40)
                                                
                    }.padding(.horizontal)
                    
                    Rectangle()
                        .frame(height: 45)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing])
                        .overlay(
                            Text("Rate (sleep/anxiety/specific attribute)")
                    )
                    Rectangle()
                        .frame(height: 90)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing])
                        .overlay(
                            Text("Text field for general comments")
                    )
                    Rectangle()
                        .frame(height: 45)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing])
                        .overlay(
                            Text("Save button")
                    )
                    
                }
                
                
                
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
        Group {
            LogCard(color: .rippleYellow, width: 400, height: 734, title: "Morning Log", expand: true)
            LogCard2(color: .rippleYellow, width: 400, height: 734, title: "Morning Log")
        }
        
    }
}


struct LogCard2: View {
    var color: Color
    var width: CGFloat
    var height: CGFloat
    var title: String
    @State var expand = false
    @State var text = ""
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(title).font(.custom("JosefinSans-Light", size: 30))
                    .padding()
                Spacer()
                
            }.onTapGesture {
                withAnimation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0.2)) {
                    self.expand.toggle()
                }
                
            }
            Divider()
            Text("To Do").font(.custom("JosefinSans-Light", size: 30))
                .padding()
            if expand {
                VStack(spacing: 20) {
                    Rectangle()
                        .frame(height: 45)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing])
                        .overlay(
                            Text("Rate overall wellness")
                    )
                    
                    Rectangle()
                        .frame(height: 45)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing])
                        .overlay(
                            Text("Rate (sleep/anxiety/specific attribute)")
                    )
                    Rectangle()
                        .frame(height: 90)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing])
                        .overlay(
                            Text("Text field for general comments")
                    )
                    Rectangle()
                        .frame(height: 45)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing])
                        .overlay(
                            Text("Save button")
                    )
                    
                }.padding()
            }
        }.background(
            Rectangle()
                .fill(self.color)
                .cornerRadius(10)
                .opacity(0.8)
                .padding([.leading, .trailing])
                .shadow(radius: 5)
        ).onTapGesture {
            withAnimation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0.2)) {
                self.expand.toggle()
            }
            
        }
        
    }
}
