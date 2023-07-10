//
//  ChartsView.swift
//  WorkoutApp
//
//  Created by Arina on 08.07.2023.
//

import UIKit

extension ChartsView {
    struct Data {
        let dataValue: Int
        let dataTitle: String
    }
}

final class ChartsView: BaseView {
    
    private let yAxisView = YAxis()
    private let xAxisView = XAxis()
    private let chartView = ChartView()
    
    func configure(withData: [ChartsView.Data]) {
        yAxisView.configure(withData: withData)
        xAxisView.configure(withData: withData)
        chartView.configure(withData: withData)
    }
}

extension ChartsView {
    override func setupViews() {
        super.setupViews()
        addSubview(yAxisView)
        addSubview(xAxisView)
        addSubview(chartView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        
        yAxisView.translatesAutoresizingMaskIntoConstraints = false
        xAxisView.translatesAutoresizingMaskIntoConstraints = false
        chartView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
            
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 12),
            chartView.topAnchor.constraint(equalTo: topAnchor),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear

    }
}

