//
//  MonthlyPerformanceView.swift
//  WorkoutApp
//
//  Created by Arina on 07.07.2023.
//

import UIKit

final class MonthlyPerformanceView: BaseInfoView {
    
    private let chartsView = ChartsView()
    
    func configure(with itmes: [ChartsView.Data]) {
        chartsView.configure(withData: itmes)
    }
    
    
}


extension MonthlyPerformanceView {
    override func setupViews() {
        super.setupViews()
        addSubview(chartsView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        chartsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            chartsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            chartsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            chartsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            chartsView.bottomAnchor.constraint (equalTo: contentView.bottomAnchor, constant: -15),
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}

