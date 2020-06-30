//
//  LogCard.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-04-08.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI


struct LogCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LogCard(color: .rippleYellow, width: 400, height: 734, title: "Morning Log", expand: true)
        }
    }
}


struct LogCard: View {
    var color: Color
    var width: CGFloat
    var height: CGFloat
    var title: String
    @State var overallWellness = 5.0
    @State var specificWellness = 5.0
    @State var expand: Bool
    @State var text = "General comments"
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Spacer()
                Text(title)
                    .modifier(headingText())
                    .padding()
                Spacer()
                
            }.onTapGesture {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.4, blendDuration: 0.2)) {
                    self.expand.toggle()
                }
            }
            
            if expand {
                
                HStack {
                    Text("Rate your overall wellness:")
                        .modifier(basicText())
                        .padding(.horizontal)
                    Spacer()
                }
                
                
                HStack {
                    CustomSlider(value: $overallWellness, range: (0, 10), knobWidth: 0) { modifiers in
                        ZStack {
                            
                            LinearGradient(gradient: .init(colors: [Color.white, Color.white]), startPoint: .bottom, endPoint: .top)
                            
                            Group {
                                Color(.sRGB, red: 0.58 - (overallWellness * 0.005), green: 0.84 - (overallWellness * 0.003), blue: 0.87 - (overallWellness * 0.064), opacity: 1.0).cornerRadius(8)
                                
                            }.modifier(modifiers.barLeft)
                            
                            HStack {
                                Text(String(Int(self.overallWellness))).foregroundColor(.black)
                                    .padding(.horizontal)
                                Spacer()
                            }
                        }.cornerRadius(8)
                    }.frame(height: 40)
                    
                }.padding(.horizontal)
                
                HStack {
                    
                    Text("Rate your specific wellness:")
                        .modifier(basicText())
                        .padding(.horizontal)
                    Spacer()
                }
                HStack {
                    CustomSlider(value: $specificWellness, range: (0, 10), knobWidth: 0) { modifiers in
                        ZStack {
                            
                            LinearGradient(gradient: .init(colors: [Color.white, Color.white]), startPoint: .bottom, endPoint: .top)
                            
                            Group {
                                Color(.sRGB, red: 0.58 - (specificWellness * 0.005), green: 0.84 - (specificWellness * 0.003), blue: 0.87 - (specificWellness * 0.064), opacity: 1.0).cornerRadius(8)
                            }.modifier(modifiers.barLeft)
                            
                            HStack {
                                Text(String(Int(self.specificWellness))).foregroundColor(.black)
                                    .padding(.horizontal)
                                Spacer()
                            }
                        }.cornerRadius(8)
                    }.frame(height: 40)
                }.padding(.horizontal)
                
                if #available(iOS 14.0, *) {
                    TextEditor(text: $text)
                        .modifier(basicText())
                        .cornerRadius(8)
                        .padding()
                    
                } else {
                    TextView(text: $text, placeholder: "Type here")
                        .cornerRadius(8)
                        .frame(height: 100)
                        .padding(.horizontal)
                }
                
                Button(action: {
                    print("Save")
                }) {
                    Rectangle()
                        .fill(Color.rippleDarkBlue)
                        .cornerRadius(8)
                        .frame(height: 40)
                        .padding(.horizontal)
                        .overlay(
                            Text("Save")
                                .modifier(basicText())
                                .foregroundColor(.white)
                        )
                    
                }.padding(.vertical)
                Spacer()
                
                
            }
        }.padding(.horizontal)
        .background(
            Rectangle()
                .fill(self.color)
                .cornerRadius(10)
                .opacity(0.8)
                .padding([.leading, .trailing])
                .shadow(radius: 5)
        )
        
    }
}
