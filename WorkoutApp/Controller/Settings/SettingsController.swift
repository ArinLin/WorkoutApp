//
//  SettingsController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

class SettingsController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        //чтобы установленные тайтлы не переносились в таббар, мы заново специально для таббара задаем значения
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.settings
    }

}
