//
//  PercentView.swift
//  WorkoutApp
//
//  Created by Arina on 03.07.2023.
//

import UIKit

extension TimerView {
    final class PercentView: BaseView {
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()
        
        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = Resourses.Fonts.helveticaRegular(with: 23)
            label.textColor = UIColor(named: "inactive")
            label.textAlignment = .center
            return label
        }()
        
        private let subtitleLabel: UILabel = {
            let label = UILabel()
            label.font = Resourses.Fonts.helveticaRegular(with: 10)
            label.textColor = UIColor(named: "maingrey")
            label.textAlignment = .center
            return label
        }()
        
        override func setupViews() {
            super.setupViews()
            
            addSubview(stackView)
            stackView.addArrangedSubview(percentLabel)
            stackView.addArrangedSubview(subtitleLabel)
            
        }
        
        override func constraintViews() {
            super.constraintViews()
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
            
        }
        
        override func configureAppearance() {
            super.configureAppearance()
        }
        
        func configure(withTitle: String, withValue: Int) {
            subtitleLabel.text = withTitle
            percentLabel.text = "\(withValue)%"
        }
    }
}
