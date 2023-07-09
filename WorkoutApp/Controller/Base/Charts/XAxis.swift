//
//  XAxis.swift
//  WorkoutApp
//
//  Created by Arina on 09.07.2023.
//

import UIKit

// рисуем ось x
final class XAxis: BaseView {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    func configure(withData: [ChartsView.Data]) {
        stackView.arrangedSubviews.forEach { // 1. когда мы меняем диапазон, например, выбираем не 10 месяцев, а 5, у нас перерисовывается вьюха с данными -> поэтому нужно в конфигурации удалять каждую вьюху
            $0.removeFromSuperview()
        }
        // 2. теперь нужно наполнить данными
        // мы должны создать 10 элементов, которые будут находиться в нашем вью (эти элемнты просто лейблы)
        withData.forEach {
            let lable = UILabel()
            lable.font = Resourses.Fonts.helveticaRegular(with: 9)
            lable.textColor = UIColor(named: "inactive")
            lable.textAlignment = .center
            lable.text = $0.title.uppercased()
            
            stackView.addArrangedSubview(lable)
        }
    }
}

extension XAxis {
    override func setupViews() {
        super.setupViews()
        
        addSubview(stackView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}

