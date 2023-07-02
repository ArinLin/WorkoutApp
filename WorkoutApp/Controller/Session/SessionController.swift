//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

class SessionController: BaseController {
    // создаем таймер
//    private let timerView: TimerView = {
//        let view = TimerView()
//
//        return view
//    }()
    
    private let timerView = TimerView()
    private let timerDuration = 3.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "High Intencity Cardio"
        // чтобы установленные тайтлы не переносились в таббар, мы заново специально для таббара задаем значения
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.session
        
        // добавляем кнопку в контроллер
        addNavigationBarButton(at: NavBarPosition.left, title: Resourses.Session.navBarStart) // здесь задаем тайтл
        addNavigationBarButton(at: NavBarPosition.right, title: Resourses.Session.navBarFinish)
        
        timerView.configure(duration: timerDuration, progress: 0.6)
    }
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        // если таймер запущен, то мы останавливаем его, если остановлен, то запускаем
        timerView.state = timerView.state == .isRuning ? .isStopped : .isRuning
        setTitleForNavBarButton(buttonTitle: timerView.state == .isRuning ? Resourses.Session.navBarPause : Resourses.Session.navBarStart,
                                at: .left)
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        
        timerView.state = .isStopped
        setTitleForNavBarButton(buttonTitle: Resourses.Session.navBarStart, at: .left)
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
        ])
    }
    
    override func configure() {
        super.configure()
        addNavigationBarButton(at: .left, title: Resourses.Session.navBarStart)
        addNavigationBarButton(at: .right, title: Resourses.Session.navBarFinish)
    }
}
