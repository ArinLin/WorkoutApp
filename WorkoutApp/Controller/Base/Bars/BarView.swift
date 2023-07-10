//
//  BarView.swift
//  WorkoutApp
//
//  Created by Arina on 06.07.2023.
//

import UIKit

// для инита
extension BarView {
    struct Data {
        let value: String
        let heightParm: Double
        let title: String
    }
}

// этот вью отвечает не за все бары, а только за один
final class BarView: BaseView {
    
    private let heightMultiplier: Double
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resourses.Fonts.helveticaRegular(with: 13)
        label.textColor = UIColor(named: "active")
        return label
    }()
    
    private let barView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "active")
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resourses.Fonts.helveticaRegular(with: 9)
//        label.textColor = UIColor(named: "maingrey")
        label.textColor = UIColor(named: "inactive")
        return label
    }()
    
    func configure(withData: [String]) {}
    
    init(data: Data) {
        self.heightMultiplier = data.heightParm
        super.init(frame: .zero)
        
        valueLabel.text = data.value
        titleLabel.text = data.title
    }
    
    required init?(coder: NSCoder) { // инициализируем 0 из нашего написанного инита, чтобы приложение не падало
        self.heightMultiplier = 0
        super.init(frame: .zero)
    }
}

extension BarView {
    override func setupViews() {
        super.setupViews()
        
        addSubview(valueLabel)
        addSubview(barView)
        addSubview(titleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        barView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo:centerXAnchor),
            valueLabel.heightAnchor.constraint(equalToConstant: 10),
            
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 7),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier * 0.8),
            
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo:centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}

