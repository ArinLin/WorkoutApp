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
        var startOfWeek: Date = Date()
        var interval: TimeInterval = 0
        calendar.dateInterval(of: .weekOfYear, start: &startOfWeek, interval: &interval, for: self)
        return startOfWeek
    }
//    var startOfWeek: Date {
//            let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
//            guard let firstDay = calendar.date(from: components) else { return self }
//            return firstDay
//        }
    
    
    
    
    
    //MARK: мой код ниже (ошибка: первая дата правильная, остальные начинаются с 1...)
//    var startOfWeek: Date {
//        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self) // берем номер текущей недели в году
//        guard let firstDay = calendar.date(from: components) else { return self }
//        return calendar.date(byAdding: .day, value: 1, to: firstDay) ?? self
//    }
    
//    func agoForward(to days: Int) -> Date {
//        return calendar.date(bySetting: .day, value: days, of: self) ?? self
//    }
}
