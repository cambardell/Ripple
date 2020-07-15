//
//  CalendarViews.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-07-14.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct CalendarTab: View {
    @EnvironmentObject var week: currentWeek
    var body: some View {
        HStack {
            Spacer()
            VStack {
                HStack {
                    Button(action: {
                        self.week.lastWeek()
                    },
                           label: {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .font(Font.title.weight(.regular))
                                .frame(width: 40, height: 30)
                                .foregroundColor(.rippleOrange)
                    })
                    Spacer()
                    Text(monthString(date: week.currentDate))
                        .modifier(titleText())
                        .padding(.top)
                    Spacer()
                    Button(action: {
                        self.week.nextWeek()
                        print(self.week.currentDate)
                    },
                           label: {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .font(Font.title.weight(.regular))
                                .frame(width: 40, height: 30)
                                .foregroundColor(.rippleOrange)
                    })
                    
                }
                WeekRow()
            }
            Spacer()
        }.padding()
            .background(Color.rippleBlue)
        
    }
    
    func monthString(date: Date) -> String {
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "MMMM"
        return formatter1.string(from: date)
    }
}

struct WeekRow: View {
    @EnvironmentObject var week: currentWeek
    let calendar = Calendar.current
    var body: some View {
        
        HStack {
            ForEach(week.days, id: \.self) { day in
                HStack {
                    Text(self.dayString(date: day))
                        .font(.custom("Jost-Light", size: 20))
                        .padding(8)
                        .background(
                            ZStack {
                                Circle()
                                    .fill(Color.rippleOrange)
                                    .frame(width: day == self.week.currentDate ? 35 : 0, height: day == self.week.currentDate ? 35 : 0)
                                    .shadow(radius: 5)
                            }
                    )
                        
                        .onTapGesture {
                            withAnimation(.spring(response: 0.1, dampingFraction: 0.2, blendDuration: 0.2)) {
                                self.week.setCurrentDateTo(date: day)
                            }
                    }
                }
            }
        }
        
    }
    
    func dayString(date: Date) -> String {
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "d"
        return formatter1.string(from: date)
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


