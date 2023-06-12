//
//  NavBarController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    private func configure() {
        view.backgroundColor = .white
        // чтобы заливка не заканчивалась по границе статус бара, тогда будет окрашивать все пространство и под статус баром
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: UIColor(named: "inactive") ?? .darkGray,
            .font: Resourses.Fonts.helveticaRegular(with: 17)
        ]
        navigationBar.addBottomBorder(wuth: UIColor(named: "inactive") ?? .darkGray, height: 1)
    }
    
}
