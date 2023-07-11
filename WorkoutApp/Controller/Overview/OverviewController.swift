//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

class OverviewController: BaseController {
    
    private let navBar = OverviewNavBar()
    private let header = SectionHeaderView()
    private let cell = TrainingCellView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configure()
        layoutViews()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews
//        cell.roundCorners([.allCorners], radius: 25)
//    }
}

// у нас есть baseController, в котором мы определили базовые методы. Теперь их нужно переопределить
extension OverviewController {
    override func addViews() {
        super.addViews()
        view.addSubview(navBar)
        view.addSubview(header)
        view.addSubview(cell)
    }
    override func configure() {
        super.configure()
        
        // установка даты в хедер
        let dateFormatter = DateFormatter ( )
        dateFormatter.dateFormat = "EEEE, dd MMMM"
        header.configure(withTitle: dateFormatter.string(from: Date()))
        
        cell.configure(withTitle: "Warm Up Cardio", subtitle: "Stair Climber • 10 minutes", isDone: true)
        // нужно заставить ячейку отрисовать свои размеры, чтобы сработала функция roundCorners и переданные в ней bounds (либо можно сделать через viewDidLayoutSubviews коммент выше)
        cell.layoutIfNeeded()
        // закругляем углы, передаем в массив, какие именно нужно закруглить
        cell.roundCorners([.allCorners], radius: 5)
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
        header.translatesAutoresizingMaskIntoConstraints = false
        cell.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            header.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            header.heightAnchor.constraint(equalToConstant: 32),
            
            cell.topAnchor.constraint(equalTo: header.bottomAnchor),
            cell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cell.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cell.heightAnchor.constraint(equalToConstant: 75),
        ])
    }
}

