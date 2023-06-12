//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

class SessionController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "High Intencity Cardio"
        // чтобы установленные тайтлы не переносились в таббар, мы заново специально для таббара задаем значения
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.session
        
        // добавляем кнопку в контроллер
        addNavigationBarButton(at: NavBarPosition.left, title: "Pause")
        addNavigationBarButton(at: NavBarPosition.right, title: "Finish")
    }
    override func navBarLeftButtonHandler() {
        print("Session NavBar left button tapped")
    }
    
    override func navBarRightButtonHandler() {
        print("Session NavBar right button tapped")
    }
    
}
