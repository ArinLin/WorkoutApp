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
    
    private let button = SecondaryButton(with: .primary)
    
//    UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .red
//        return button
//    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(named: "maingrey")?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()
    
    init(with title: String? = nil, buttonTitle: String? = nil) {

        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        button.setTitle(title: buttonTitle)
        // если не передали тайтл для кнопки, то установится наш titleLabel по середине, а кнопка будет скрыта
        button.isHidden = buttonTitle == nil ? true : false
        // меняем местами, чтобы наш кастомный констрейнт для топАнкора срабатывал
        super.init (frame: .zero)
    }
    
    func addButtonTarget(target: Any?, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseInfoView {
    override func setupViews() {
        super.setupViews()
        addSubview(titleLabel)
        addSubview(button)
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
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        titleLabel.topAnchor.constraint(equalTo: topAnchor),
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        button.trailingAnchor.constraint(equalTo: trailingAnchor),
        button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
        button.widthAnchor.constraint(equalToConstant: 130),
        button.heightAnchor.constraint(equalToConstant: 30),
        
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
