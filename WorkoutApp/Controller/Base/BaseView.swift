//
//  BaseView.swift
//  WorkoutApp
//
//  Created by Arina on 13.06.2023.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView() 
        layoutViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BaseView {
    func addView() {
        
    }
    
    func layoutViews() {
        
    }
    
    func configureViews() {
        
    }
}
