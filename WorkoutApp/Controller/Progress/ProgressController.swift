//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

class ProgressController: BaseController {
    
    private let dailyPerformanceView = DailyPerformanceView(with: Resourses.Progress.dailyPerformance,
                                                            buttonTitle: Resourses.Progress.last7Days.uppercased())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProgressController {
    
    override func addViews() {
        super.addViews()
        
        view.addSubview(dailyPerformanceView)
        
    }
    override func layoutViews() {
        super.layoutViews()
        
        dailyPerformanceView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate ([
        dailyPerformanceView.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant:15),
        dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
        dailyPerformanceView.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant:-15),
        dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier:0.68)
        ])
    }
    
    override func configure() {
        super.configure()
        
        title = "Workout Progress"
        //чтобы установленные тайтлы не переносились в таббар, мы заново специально для таббара задаем значения
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.progress
        
        // добавляем кнопку в контроллер
        addNavigationBarButton(at: NavBarPosition.left, title: "Export")
        addNavigationBarButton(at: NavBarPosition.right, title: "Details")
        
        dailyPerformanceView.configure(with: [.init (value: "1", heightParm: 0.25, title: "Mon"),
                                              .init (value: "2", heightParm: 0.4, title: "Teu"),
                                              .init (value: "3", heightParm: 0.6, title: "Wen"),
                                              .init (value: "4", heightParm: 0.8, title: "Thu"),
                                              .init (value: "5", heightParm: 1, title: "Fri"),
                                              .init (value: "3", heightParm: 0.6, title: "Sat"),
                                              .init (value: "2", heightParm: 0.4, title: "Sun")
        ])
    }
}
