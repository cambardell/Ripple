//
//  GraphView.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-06-24.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct BarGraph: View {
    
    let data = [0.1, 0.2, 0.3, 0.4, 0.3, 0.9, 0.2]
    @State var displayGraph = true
    
    var body: some View {
        VStack {
            VStack {
                ForEach(data, id: \.self) { item in
                    
                    HStack {
                        Text("Day")
        
                        Rectangle()
                            .transform(CGAffineTransform(scaleX: CGFloat(item), y: 1))
                            .fill(Color.rippleRed)
                            .cornerRadius(8)
                            

                        Circle()
                            .fill(Color.rippleOrange)
                            .frame(width: 30, height: 30)
                            .overlay(
                                Text(String(Int(item * 10)))
                            )
                        
                    }
                }
            }.padding()
        }
        .background(Color.rippleBlue)
        .cornerRadius(8)
        .padding()
        .shadow(radius: 5)
    }
}

struct Graph_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BarGraph()
                .frame(height: 300)
        }
    }
}

