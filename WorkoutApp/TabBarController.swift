//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

// Создаем наш кастомный TabBar
import UIKit

// сразу определяем количество табов и задаем их в enum
enum Tabs: Int {
    case overview
    case session
    case progress
    case settings
}


final class TabBarController: UITabBarController {
    // 6. Cоздаем для отображения
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 1. зададим внешний вид таба -- это будет функция приватной конфигурации
    private func config() {
        // установим таббару цвет
        tabBar.tintColor = UIColor(named: "active")
        tabBar.barTintColor = UIColor(named: "inactive")
        tabBar.backgroundColor = .white
        
        // устанавливаем границу, отделяющую основной контент от таббара
        tabBar.layer.borderColor = UIColor(named: "maingrey")?.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        // 2. необходимо добавить в таббар наши 4 элемента
        // создадим пока по дефолту
        let overviewController = UIViewController()
        let sessionController = UIViewController()
        let progressController = UIViewController()
        let settingsController = UIViewController()
        
        // 3. теперь нужно создать навигейшн контроллеры
// это с дефолтным значением, впоследствии UINavigationController заменим на наш созданный NavBarController        let overviewNavigation = UINavigationController(rootViewController: overviewController)
        let overviewNavigation = NavBarController(rootViewController: overviewController)
        let sessionNavigation = NavBarController(rootViewController: sessionController)
        let progressNavigation = NavBarController(rootViewController: progressController)
        let settingsNavigation = NavBarController(rootViewController: settingsController)
        
        // 4. теперь нужно создать элементы таббара для каждого навигейшн
        overviewNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.overview, image: Resourses.Images.TabBar.overview, tag: Tabs.overview.rawValue)
        sessionNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.session, image: Resourses.Images.TabBar.session, tag: Tabs.session.rawValue)
        progressNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.progress, image: Resourses.Images.TabBar.progress, tag: Tabs.progress.rawValue)
        settingsNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.settings, image: Resourses.Images.TabBar.settings, tag: Tabs.settings.rawValue)
        
        //5. мы добавили наши элементы, теперь их нужно сложить в setViewControllers
        setViewControllers([
            overviewNavigation,
            sessionNavigation,
            progressNavigation,
            settingsNavigation
        ], animated: false)
    }
}
