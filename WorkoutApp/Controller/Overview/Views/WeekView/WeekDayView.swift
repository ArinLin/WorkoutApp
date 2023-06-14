//
//  WeekDayView.swift
//  WorkoutApp
//
//  Created by Arina on 14.06.2023.
//

import UIKit

extension WeekView {
    final class WeekDayView: BaseView {
        
        private let weekName = UILabel()
        private let dateNumber = UILabel()
        private let dataStack = UIStackView()
//      для создания и заполнения даты. Входящие параметры: index дня недели, который у нас отрисовывается и название дня недели, которое мы храним в weekdays
        func makeData(with index: Int, name: String) {
            // определяем текущий день
            let startOfWeek = Date().startOfWeek
            let currentDay = startOfWeek.agoForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            
            weekName.text = name.uppercased()
            dateNumber.text = "\(day)"
            
        }
    }
}

extension WeekView.WeekDayView {
    override func addView() {
        super.addView()
        addSubview(dataStack)
        dataStack.addArrangedSubview(weekName)
        dataStack.addArrangedSubview(dateNumber)
    }
    override func configureViews() {
        super.configureViews()
        dataStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dataStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            dataStack.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        weekName.font = Resourses.Fonts.helveticaRegular(with: 9)
        weekName.textAlignment = .center
        
        dateNumber.font = Resourses.Fonts.helveticaRegular(with: 15)
        dateNumber.textAlignment = .center
        
        dataStack.spacing = 3
        dataStack.axis = .vertical
    }
}

