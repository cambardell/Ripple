//
//  DatesModel.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-05-27.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import Foundation

class currentWeek: ObservableObject {
    @Published var currentDate = Date()
    @Published var days = returnDaysOfWeek(date: Date())
    
    func setCurrentDateTo(date: Date) {
        self.currentDate = date
        print(self.currentDate)
    }
    
    func nextWeek() {
        var  dateComponent = DateComponents()
        dateComponent.day = 7
        self.currentDate = Calendar.current.date(byAdding: dateComponent, to: self.currentDate)!
        days = returnDaysOfWeek(date: currentDate)
    }
    
    func lastWeek() {
        var  dateComponent = DateComponents()
        dateComponent.day = -7
        self.currentDate = Calendar.current.date(byAdding: dateComponent, to: self.currentDate)!
        days = returnDaysOfWeek(date: currentDate)
    }
}

func returnDaysOfWeek(date: Date) -> [Date] {
    let calendar = Calendar.current
    let today = calendar.startOfDay(for: date)
    
    let dayOfWeek = calendar.component(.weekday, from: today)
    
    let daysOfWeek = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
    let days = (daysOfWeek.lowerBound ..< daysOfWeek.upperBound).compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }
    
    return days
}
