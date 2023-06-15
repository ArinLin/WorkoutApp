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
//MARK: Мой код для создания и заполнения даты. Входящие параметры: index дня недели, который у нас отрисовывается и название дня недели, которое мы храним в weekdays
//        func makeData(with index: Int, name: String) {
//            // определяем текущий день
//            let starOfWeek = Date().startOfWeek
//            let currentrDay = starOfWeek.agoForward(to: index)
//            let day = Calendar.current.component(.day, from: currentrDay)
//
//            weekName.text = name.uppercased()
//            dateNumber.text = "\(day)"
//
//        }
        // 2 функции ниже брутфорса -------------------------------------------------
//        func makeData(with index: Int, name: String) {
//                    let startOfWeek = Date().startOfWeek
//                    let currentDate = startOfWeek.addingTimeInterval(Double(index) * 24 * 60 * 60)
//                    let day = Calendar.current.component(.day, from: currentDate)
//
//                    weekName.text = name.uppercased()
//                    dateNumber.text = "\(day)"
//                }
        func makeData(with index: Int, name: String) {
            let startOfWeek = Date().startOfWeek
            guard let currentDate = Calendar.current.date(byAdding: .day, value: index + 1, to: startOfWeek) else { return }
            let day = Calendar.current.component(.day, from: currentDate)
            // для подствечивания сегодняшней даты
            let isTooday = currentDate.stripTime () == Date().stripTime()
            backgroundColor = isTooday ? UIColor(named: "active") : UIColor(named: "bgSky")
            
            weekName.text = name.uppercased()
            weekName.textColor = isTooday ? UIColor(named: "bgSky") : UIColor(named: "active")
            dateNumber.text = "\(day)"
            dateNumber.textColor = isTooday ? UIColor(named: "bgSky") : UIColor(named: "active")
        }
    }
}

extension WeekView.WeekDayView {
    override func setupViews() {
        super.setupViews()
        addSubview(dataStack)
        dataStack.addArrangedSubview(weekName)
        dataStack.addArrangedSubview(dateNumber)
    }
    override func configureAppearance() {
        super.configureAppearance()
        dataStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dataStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            dataStack.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    override func constraintViews() {
        super.constraintViews()
        
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

