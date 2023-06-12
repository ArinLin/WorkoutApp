//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit
// создаем дефолтный котнроллер
class OverviewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Overview"
        //чтобы установленные тайтлы не переносились в таббар, мы заново специально для таббара задаем значения
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.overview
    }

}

