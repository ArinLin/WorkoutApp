//
//  StatsItemView.swift
//  WorkoutApp
//
//  Created by Arina on 04.07.2023.
//

import UIKit

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
    
    func cunfigure(with item: StatsItem) {
        imageView.image = item.image
        valueLabel.text = item.value
        titleLabel.text = item.title
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
