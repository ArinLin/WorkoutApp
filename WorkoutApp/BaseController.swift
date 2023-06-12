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
        
        configure()
    }
}

@objc extension BaseController {
    func addViews() {}
    func layoutViews() {}
    func configure() {
        view.backgroundColor = .white
    }
}
