//
//  BarsView.swift
//  WorkoutApp
//
//  Created by Arina on 06.07.2023.
//

import UIKit

final class BarsView: BaseView {
    
    private let stackStepsView: UIStackView = {
        let view = UIStackView()
//        view.distribution = .equalSpacing
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(withData: [BarView.Data]) {
        withData.forEach {
            let barView = BarView(data: $0)
            
            stackStepsView.addArrangedSubview(barView)
        }
    }
}

extension BarsView {
    override func setupViews() {
        super.setupViews()
        addSubview(stackStepsView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        
        stackStepsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackStepsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackStepsView.topAnchor.constraint(equalTo: topAnchor),
            stackStepsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackStepsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}
