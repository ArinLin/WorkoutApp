//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

class ProgressController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Workout Progress"
        //чтобы установленные тайтлы не переносились в таббар, мы заново специально для таббара задаем значения
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.progress
        
        // добавляем кнопку в контроллер
        addNavigationBarButton(at: NavBarPosition.left, title: "Export")
        addNavigationBarButton(at: NavBarPosition.right, title: "Details")
    }

}
