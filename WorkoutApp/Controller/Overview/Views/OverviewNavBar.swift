//
//  OverviewNavBar.swift
//  WorkoutApp
//
//  Created by Arina on 13.06.2023.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let titleLable = UILabel()
    private let allWarkoutsButton = SecondaryButton()
    private let addButton = UIButton()
    // тестовый вариант
    private let weekView = WeekView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(wuth: UIColor(named: "maingrey") ?? .systemGray, height: 1)
    }
    
    func addAllWorkoutAction(action: Selector, with target: Any?) {
        allWarkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addAdditingAction(action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension OverviewNavBar {
    override func addView() {
        super.addView()
        addSubview(titleLable)
        addSubview(allWarkoutsButton)
        addSubview(addButton)
        addSubview(weekView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWarkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWarkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWarkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWarkoutsButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLable.centerYAnchor.constraint(equalTo: allWarkoutsButton.centerYAnchor),
            titleLable.trailingAnchor.constraint(equalTo: allWarkoutsButton.leadingAnchor),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: allWarkoutsButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        backgroundColor = .white
        
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.text = "Today"
        titleLable.textColor = UIColor(named: "maingrey")
        titleLable.font = Resourses.Fonts.helveticaRegular(with: 22)
        
        allWarkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        allWarkoutsButton.setTitle(title: Resourses.Overview.allWorkoutsButton)
//        allWarkoutsButton.addTarget(self, action: #selector(allWorkoutButtonAction), for: .touchUpInside)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setImage(Resourses.Images.Common.circlePlus, for: .normal)
//        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        
        weekView.translatesAutoresizingMaskIntoConstraints = false
    }
}

//@objc extension OverviewNavBar {
//    func allWorkoutButtonAction() {
//        print("All workouts button tapped")
//    }
//
//    func addButtonAction() {
//        print("All workouts button tapped")
//    }
//}
