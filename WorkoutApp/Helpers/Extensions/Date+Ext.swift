//
//  Date+Ext.swift
//  WorkoutApp
//
//  Created by Arina on 14.06.2023.
//

import Foundation

extension Date {
    private var calendar: Calendar {
        return Calendar.current
    }
    
    var startOfWeek: Date {
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        guard let firstDay = calendar.date(from: components) else { return self }
        return calendar.date(byAdding: .day, value: 1, to: firstDay) ?? self
    }
    
    func agoForward(to days: Int) -> Date {
        return calendar.date(bySetting: .day, value: days, of: self) ?? self
    }
}
