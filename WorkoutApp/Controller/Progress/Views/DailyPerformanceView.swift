//
//  PerformanceView.swift
//  WorkoutApp
//
//  Created by Arina on 06.07.2023.
//

import UIKit

final class DailyPerformanceView: BaseInfoView {
    
    private let barsView = BarsView()
    
    func configure(with itmes: [BarView.Data]) {
        barsView.configure(withData: itmes)
    }
    
    
}


extension DailyPerformanceView {
    override func setupViews() {
        super.setupViews()
        addSubview(barsView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        barsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            barsView.bottomAnchor.constraint (equalTo: contentView.bottomAnchor, constant: -15),
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
