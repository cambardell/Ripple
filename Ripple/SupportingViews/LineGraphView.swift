//
//  Line.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-07-15.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct LineGraphView: View {
    let data: [CGFloat] = [0.1, 0.6, 0.3, 0.4, 0.3, 0.9, 0.2, 0.1, 0.6, 0.3, 0.4, 0.3, 0.9, 0.1, 0.6, 0.3, 0.4, 0.3, 0.9]
    
    @State var on = false
    
    var body: some View {
        
            VStack {
                ZStack {
                    VStack {
                        ForEach((1...10), id: \.self) { item in
                            VStack {
                                GridLine(delay: Double(item))
                                Spacer()
                            }
                            
                        }
                    }
                    
                    LineGraph(dataPoints: data)
                        .trim(from: 0, to: on ? 1 : 0)
                        .stroke(lineWidth: 2.0)
                        .foregroundColor(.rippleRed)
                    lineGraphPoints(dataPoints: data)
                        .trim(to: on ? 1 : 0)
                        .fill(Color.rippleRed)
                        .foregroundColor(.rippleRed)
                    
                    
                        
                }.padding()
                .onAppear {
                        self.on.toggle()
                }
            }.background(Color.rippleBlue.opacity(0.5))
               .cornerRadius(8)
               .padding()
               .shadow(radius: 5)
        
        
    }
}

struct LineGraph: Shape {
    var dataPoints: [CGFloat]

    func path(in rect: CGRect) -> Path {
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * CGFloat(ix) / CGFloat(dataPoints.count - 1)
            let y = (1-point) * rect.height
            return CGPoint(x: x, y: y)
        }

        return Path { p in
            guard dataPoints.count > 1 else { return }
            let start = dataPoints[0]
            
            p.move(to: CGPoint(x: 0, y: (1-start) * rect.height))
            for idx in dataPoints.indices {
                p.addLine(to: point(at: idx))
            }
            
            
        }
    }
}

struct lineGraphPoints: Shape {
    var dataPoints: [CGFloat]

    func path(in rect: CGRect) -> Path {
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * CGFloat(ix) / CGFloat(dataPoints.count - 1)
            let y = (1-point) * rect.height
            return CGPoint(x: x, y: y)
        }

        return Path { p in
            guard dataPoints.count > 1 else { return }
            let start = dataPoints[0]
            
            p.move(to: CGPoint(x: 0, y: (1-start) * rect.height))
            for idx in dataPoints.indices {
                p.move(to: point(at: idx))
                p.addArc(center: point(at: idx), radius: 5, startAngle: .degrees(0), endAngle: .degrees(1), clockwise: true)
            }
            
            
        }
    }
}

struct LineGraphView_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphView().frame(height: 500)
    }
}
