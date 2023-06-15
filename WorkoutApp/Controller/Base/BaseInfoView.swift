//
//  BaseInfoView.swift
//  WorkoutApp
//
//  Created by Arina on 15.06.2023.
//

import UIKit

final class BaseInfoView: BaseView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resourses.Fonts.helveticaRegular(with: 13)
        label.textColor = UIColor(named: "inactive")
        
        return label
    }()
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(named: "maingrey")?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()
    
    init(with title: String? = nil, alignment: NSTextAlignment = .left) {

        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = alignment
        // меняем местами, чтобы наш кастомный констрейнт для топАнкора срабатывал
        super.init (frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseInfoView {
    override func setupViews() {
        super.setupViews()
        addSubview(titleLabel)
        addSubview(contentView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        // необходимо создать такие констрейнты, чтобы когда у вью нет titleLabel, topAnchor отсчитывался не от несуществующего titleLabel, а от topAnchor вью
        // 1. Создаем перемнную
        let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        // 2. Задаем отступ
        let contentTopOffset: CGFloat = titleLabel.text == nil ? 0 : 10
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        titleLabel.topAnchor.constraint(equalTo: topAnchor),
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        
//        contentView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
        contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: contentTopOffset),
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}
