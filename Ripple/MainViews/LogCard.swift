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
    var barColor: Color
    var title: String
    var morning: Bool
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var overallWellness = 5.0
    @State var specificWellness = 5.0
    @State var expand: Bool
    @State var text = "General comments"
    
    @Binding var logCompleted: Bool
    
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Spacer()
                Text(title)
                    .modifier(headingText())
                    .padding(.top)
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
                            
                            Color.white
                            
                            Group {
                                self.barColor
                                    .cornerRadius(8)
                                    .shadow(radius: 5)
                                
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
                            
                            Color.white
                            
                            Group {
                                self.barColor
                                    .cornerRadius(8)
                                    .shadow(radius: 5)
                                // Color(.sRGB, red: 0.58 - (specificWellness * 0.005), green: 0.84 - (specificWellness * 0.003), blue: 0.87 - (specificWellness * 0.064), opacity: 1.0).cornerRadius(8)
                            }.modifier(modifiers.barLeft)
                            
                            HStack {
                                Text(String(Int(self.specificWellness))).foregroundColor(.black)
                                    .padding(.horizontal)
                                Spacer()
                            }
                        }.cornerRadius(8)
                    }.frame(height: 40)
                }.padding(.horizontal)
                
                
                Button(action: {
                    print("Save")
                    self.saveLog()
                    withAnimation {
                        self.logCompleted.toggle()
                    }
                    
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
                    
                }.padding(.bottom)
                Spacer()
                
                
            }
        }.padding()
        .background(
            Rectangle()
                .fill(self.color)
                .cornerRadius(10)
                .opacity(0.5)
                .padding()
                .shadow(radius: 5)
        )
        
    }
    
    func saveLog() {
        let log = Log(context: self.managedObjectContext)
        log.overallRating = self.overallWellness
        log.specificRating = self.specificWellness
        log.date = Calendar.current.startOfDay(for: Date())
        print(Date())
        log.specificAttribute = "placeholder"
        log.morning = morning
        do {
            try self.managedObjectContext.save()
        } catch {
            // handle the Core Data error
            print("Failed to save new item. Error = \(error)")
            
        }
    }
}


struct LogCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LogCard(color: .rippleYellow, barColor: .rippleBlue, title: "Morning Log", morning: true, expand: true, logCompleted: Binding.constant(false))
        }
    }
}
