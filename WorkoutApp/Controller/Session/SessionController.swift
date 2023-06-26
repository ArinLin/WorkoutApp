//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

class SessionController: BaseController {
    // создаем таймер
    private let timerView: BaseInfoView = {
        let view = BaseInfoView(with: "Test", buttonTitle: "TestButton".uppercased())
        
        return view
    }()

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

extension SessionController {
    override func addViews() {
        super.addViews()
        view.addSubview(timerView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        timerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate ([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configure() {
        super.configure()
        
    }
}
