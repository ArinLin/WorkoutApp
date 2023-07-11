//
//  BaseController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        layoutViews()
        configure()
    }
}

@objc extension BaseController {
    func addViews() {}
    func layoutViews() {}
    func configure() {
        view.backgroundColor = UIColor(named: "bg")
    }
    // нужно определить 2 функции из настройки кнопок
    func navBarLeftButtonHandler() {
        print("left button tapped")
    }
    
    func navBarRightButtonHandler() {
        print("right button tapped")
    }
}
// для того, чтобы выбирать какая кнопка будет левая или правая?
enum NavBarPosition {
    case left
    case right
}

// для добавления кнопок в контроллеры, создаем в BaseController расширение
extension BaseController {
    func addNavigationBarButton(at position: NavBarPosition, title: String) {
        // создаем кнопку
        let button = UIButton(type: .system)
        // устанавливаем тайтл
        button.setTitle(title, for: .normal)
        // устанавливаем цвет
        button.setTitleColor(UIColor(named: "active"), for: .normal)
        button.setTitleColor(UIColor(named: "inactive"), for: .disabled)
        // устанавливаем шрифт
        button.titleLabel?.font = Resourses.Fonts.helveticaRegular(with: 17)
        
        // смотря как позиция кнопки, нужно добавить таргет
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func setTitleForNavBarButton(buttonTitle: String, at position: NavBarPosition) {
        switch position {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }
        view.layoutIfNeeded() // чтобы хватало место кнопке и не появлялось троеточие
    }
}
