//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Arina on 14.06.2023.
//

import UIKit

final class WeekView: BaseView {
    
    private let weekStack = UIStackView()
    private let calendar = Calendar.current
    
}

extension WeekView {
    override func setupViews() {
        super.setupViews()
        addSubview(weekStack)
    }
    override func configureAppearance() {
        super.configureAppearance()
        weekStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weekStack.topAnchor.constraint(equalTo: topAnchor),
            weekStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            weekStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            weekStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        weekStack.spacing = 7
        // устанавливаем насколько одинаково элементы должны располагаться и заполнять пространство
        weekStack.distribution = .fillEqually
        // настройка календаря
        var weekdays = calendar.shortStandaloneWeekdaySymbols //"Sun" "Mon", "Tue", "Wed" etc начинается с воскресенья -- это ок для англ календаря, но не для русского
        // для того, чтобы сделать календарь, который начинается с пн:
        if calendar.firstWeekday == 1 {
            let Sunday = weekdays.remove(at: 0)
            weekdays.append(Sunday)
        }
        
        
        // перебираем массив строк weekdays и каждый элемент засовываем в weekStack
        weekdays.enumerated().forEach { index, dataName in
            let view = WeekDayView()
            view.makeData(with: index, name: dataName)
            weekStack.addArrangedSubview(view)
        }

    }
}
