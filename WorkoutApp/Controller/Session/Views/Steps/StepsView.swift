//
//  StepsView.swift
//  WorkoutApp
//
//  Created by Arina on 06.07.2023.
//

import UIKit

final class StepsView: BaseInfoView {
    
    private let barsView = BarsView()
    
    func configure(with items: [BarView.Data]) {
        barsView.configure(withData: items)
    }
}

extension StepsView {
    override func setupViews() {
        super.setupViews()

        addSubview(barsView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        barsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}

