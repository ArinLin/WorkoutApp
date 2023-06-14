//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

class OverviewController: BaseController {
    
    private let navBar = OverviewNavBar()
    private let allWarkoutsButton = SecondaryButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configure()
        layoutViews()
//        title = "Overview"
//        //чтобы установленные тайтлы не переносились в таббар, мы заново специально для таббара задаем значения
//        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.overview
    }
}

// у нас есть baseController, в котором мы определили базовые методы. Теперь их нужно переопределить
extension OverviewController {
    override func addViews() {
        super.addViews()
        view.addSubview(navBar)
        view.addSubview(allWarkoutsButton)
    }
    override func configure() {
        super.configure()
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            navBar.heightAnchor.constraint(equalToConstant: 113),
            
//            allWarkoutsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            allWarkoutsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            allWarkoutsButton.heightAnchor.constraint(equalToConstant: 28),
//            allWarkoutsButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
}

