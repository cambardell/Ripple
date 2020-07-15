//
//  GraphView.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-06-24.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct BarGraph: View {
    
    let data = [0.1, 0.2, 0.3, 0.4, 0.3, 0.9, 0.2]
    @State var displayGraph = true
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    // To match above layer
                    Text("Day").foregroundColor(.clear)
                    ForEach((1...10), id: \.self) { item in
                        VStack {
                            GridLine(delay: Double(item))
                            Spacer()
                        }
                        
                    }
                }.padding()
                
                HStack(alignment: .bottom) {
                    ForEach((0...data.count-1), id: \.self) { index in
                        VStack {
                            Text("Day")
                            ZStack {
                                Bar(item: self.data[index], delay: Double(index))
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color.rippleBlue)
        .cornerRadius(8)
        .padding()
        .shadow(radius: 5)
    }
}

struct Graph_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BarGraph()
                .frame(height: 300)
            BarGraph()
                .frame(height: 300)
            Text("Something about comments")
                
        }
    }
}


struct Bar: View {
    var item: Double
    var delay: Double
    @State var height: Double = 0.0
    var animation: Animation {
        Animation.linear(duration: 0.5)
            
            
    }
    
    var body: some View {
        GeometryReader { geometry in
            BarShape(width: Double(geometry.size.width), height: self.height, finalHeight: Double(geometry.size.height))
                .fill(Color.rippleRed)
                .scaleEffect(CGSize(width: 0.7, height: self.item), anchor: .bottom)
                .shadow(radius: 5)
                .onAppear {
                    withAnimation(self.animation) {
                        self.height = Double(geometry.size.height)
                    }
                }
        }
        
    }
}

struct BarShape: Shape {
    var width: Double
    var height: Double
    var finalHeight: Double
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // GeometryReader renders from top down, so this weird stuff is to animate top to bottom. 
        path.move(to: CGPoint(x: 0, y: finalHeight - height))
        path.addLine(to: CGPoint(x: width, y: finalHeight - height))
        path.addLine(to: CGPoint(x: width, y: finalHeight))
        path.addLine(to: CGPoint(x: 0, y: finalHeight))
        path.addLine(to: CGPoint(x: 0, y: finalHeight - height))
        return path
    }
    
    var animatableData: Double {
        get { return height }
        set { height = newValue }
    }
    
    
}


struct GridLine: View {
    @State var length: Double = 0.0
    var delay: Double
    
    var animation: Animation {
        Animation.linear(duration: 0.3)
            // So they animate in succession.
            .delay(delay / 20)
    }
    
    var body: some View {
        GeometryReader { geometry in
            GridLineShape(length: self.length)
                .stroke(lineWidth: 1)
                .foregroundColor(.gray)
                .onAppear {
                    withAnimation(self.animation) {
                        self.length = Double(geometry.size.width)
                    }
                }
        }
    }
}

struct GridLineShape: Shape {
    var length: Double
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: length, y: 0))
        return path
    }
    
    var animatableData: Double {
        get { return length }
        set { length = newValue }
    }
}


