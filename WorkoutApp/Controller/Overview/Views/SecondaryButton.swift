//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

final class SecondaryButton: UIButton {
    
    private let rightButtonLabel = UILabel()
    private let rightButtonIcon = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews() 
        layoutViews()
        configure()
    }
    
    // при переносе вью на контроллер, мы не указываем текст для лейбла. Необходимо здесь сделать метод, который будет добавлять наш rightButtonLabel как тайтл
    func setTitle(title: String) {
        rightButtonLabel.text = title
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SecondaryButton {
    func addViews() {
        addSubview(rightButtonLabel)
        addSubview(rightButtonIcon)
    }
    func layoutViews() {
        NSLayoutConstraint.activate([
            rightButtonIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightButtonIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            rightButtonIcon.heightAnchor.constraint(equalToConstant: 5),
            rightButtonIcon.widthAnchor.constraint(equalToConstant: 10),
            
            rightButtonLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightButtonLabel.trailingAnchor.constraint(equalTo: rightButtonIcon.leadingAnchor),
            rightButtonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    func configure() {
        backgroundColor = UIColor(named: "bgSky")
        layer.cornerRadius = 14
        
        rightButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        rightButtonLabel.textColor = UIColor(named: "active")
        rightButtonLabel.textAlignment = .center
        rightButtonLabel.font = Resourses.Fonts.helveticaRegular(with: 15)
        
        rightButtonIcon.translatesAutoresizingMaskIntoConstraints = false
        rightButtonIcon.image = Resourses.Images.Common.downArrow
        rightButtonIcon.tintColor = UIColor(named: "active")
    }
}
