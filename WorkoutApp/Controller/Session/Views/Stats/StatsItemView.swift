//
//  StatsItemView.swift
//  WorkoutApp
//
//  Created by Arina on 04.07.2023.
//

import UIKit

enum StatsItemDataSource {
    case averagePace (value: String)
    case heartRate (value: String)
    case totalDistance (value: String)
    case totalSteps (value: String)
    
    var itemData: StatsItemView.StatsItem {
        switch self {
        case .averagePace(let value):
            return .init(image: Resourses.Images.SessionView.speedometr,
                         value: value + " / km",
                         title: Resourses.Session.averagePace)
        case .heartRate(let value):
            return .init(image: Resourses.Images.SessionView.heartRate,
                         value: value + " bpm",
                         title: Resourses.Session.heartRate)
        case .totalDistance(let value):
            return .init(image: Resourses.Images.SessionView.route,
                         value: value + " km",
                         title: Resourses.Session.totalDistance)
        case .totalSteps(let value):
            return .init(image: Resourses.Images.SessionView.steps,
                         value: value,
                         title: Resourses.Session.totalSteps)
        }
    }
    
}


final class StatsItemView: BaseView {
    // набор айтемов, которые мы кидаем в функцию configure
    struct StatsItem {
        let image: UIImage?
        let value: String
        let title: String
    }
    // вьюхи
    private let imageView = UIImageView()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resourses.Fonts.helveticaRegular(with: 17)
        label.textColor = UIColor(named: "inactive")
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resourses.Fonts.helveticaRegular(with: 10)
        label.textColor = UIColor(named: "maingrey")
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    func configure(with item: StatsItemDataSource) {
        imageView.image = item.itemData.image
        valueLabel.text = item.itemData.value
        titleLabel.text = item.itemData.title.uppercased()
    }
}


extension StatsItemView {
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(titleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 23),
//            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo:bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
