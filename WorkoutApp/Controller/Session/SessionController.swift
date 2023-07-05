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
    private let statsView = StatsView(with: Resourses.Session.workoutStats)
    private let stepsView = BaseInfoView(with: Resourses.Session.stepsCounter)
    
    private let timerDuration = 15.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "High Intencity Cardio"
        // чтобы установленные тайтлы не переносились в таббар, мы заново специально для таббара задаем значения
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.session
        
        // добавляем кнопку в контроллер
        addNavigationBarButton(at: NavBarPosition.left, title: Resourses.Session.navBarStart) // здесь задаем тайтл
        addNavigationBarButton(at: NavBarPosition.right, title: Resourses.Session.navBarFinish)
        
        timerView.configure(duration: timerDuration, progress: 0)
        
        // говорим, что в колбеке будет выполняться определенный код
        timerView.callBack = { [weak self] in
            // немного отложим обратный пробег таймера на 1 секунду
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self?.navBarRightButtonHandler()
            }
        }
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
        view.addSubview(statsView)
        view.addSubview(stepsView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        timerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate ([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
        
        statsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
//            statsView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        stepsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor),
        ])
    }
    
    override func configure() {
        super.configure()
        addNavigationBarButton(at: .left, title: Resourses.Session.navBarStart)
        addNavigationBarButton(at: .right, title: Resourses.Session.navBarFinish)
        
        statsView.configure(with: [.heartRate(value: "162"),
                                   .averagePace(value: "5.3"),
                                   .totalDistance(value: "8.1"),
                                   .totalSteps(value: "12 320")
                                  ])
    }
}
