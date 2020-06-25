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
            
                HStack(alignment: .bottom) {
                    ForEach(data, id: \.self) { item in
                        
                        VStack {
                            Text(String(Int(item * 10)))
                            
                            GeometryReader { geometry in
                                VStack {
                                    Spacer()
                                    Rectangle()
                                        .fill(Color.rippleRed)
                                        .frame(height: geometry.size.height * CGFloat(item))
                                        .cornerRadius(8)
                                }
                            }
                            
                            Text("Day")
                        }
                    }
                }.padding()

        }
        .background(Color.rippleBlue)
        .cornerRadius(8)
        .padding()
        
        
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

