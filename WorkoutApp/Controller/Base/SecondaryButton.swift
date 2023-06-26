//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

public enum SecondaryButtonType {
    case primary
    case secondary
}

final class SecondaryButton: UIButton {
    
    private var type: SecondaryButtonType = .primary
    
    private let rightButtonLabel = UILabel()
    private let rightButtonIcon = UIImageView()
    
    init(with type: SecondaryButtonType) {
        super.init(frame: .zero)
        self.type = type
        
        addViews()
        layoutViews()
        configure()
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addViews()
//        layoutViews()
//        configure()
//    }
    
    // при переносе вью на контроллер, мы не указываем текст для лейбла. Необходимо здесь сделать метод, который будет добавлять наш rightButtonLabel как тайтл
    func setTitle(title: String?) {
        rightButtonLabel.text = title
    }
    
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        addViews()
        layoutViews()
        configure()
    }
}

private extension SecondaryButton {
    func addViews() {
        addSubview(rightButtonLabel)
        addSubview(rightButtonIcon)
    }
    func layoutViews() {
        
        var horisontal0ffset: CGFloat {
            switch type {
            case .primary: return 0
            case .secondary: return 10
            }
        }
            
        NSLayoutConstraint.activate([
            rightButtonIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightButtonIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horisontal0ffset),
            rightButtonIcon.heightAnchor.constraint(equalToConstant: 5),
            rightButtonIcon.widthAnchor.constraint(equalToConstant: 10),
            
            rightButtonLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            rightButtonLabel.trailingAnchor.constraint(equalTo: rightButtonIcon.leadingAnchor),
            rightButtonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horisontal0ffset * 2)
        ])
    }
    func configure() {
        switch type {
        case .primary:
            rightButtonLabel.textColor = UIColor(named: "inactive")
            rightButtonIcon.tintColor = UIColor(named: "inactive")
            rightButtonLabel.font = Resourses.Fonts.helveticaRegular(with: 13)
        case .secondary:
            backgroundColor = UIColor(named: "bgSky")
            layer.cornerRadius = 14
            rightButtonLabel.textColor = UIColor(named: "active")
            rightButtonIcon.tintColor = UIColor(named: "active")
            rightButtonLabel.font = Resourses.Fonts.helveticaRegular(with: 15)
        }
        
        
//        backgroundColor = UIColor(named: "bgSky")
//        layer.cornerRadius = 14
        makeSystem(button: self) // устанавливаем заданную в UIView+Ext анимацию для кнопки
        
        rightButtonLabel.translatesAutoresizingMaskIntoConstraints = false
//        rightButtonLabel.textColor = UIColor(named: "active")
        rightButtonLabel.textAlignment = .center
//        rightButtonLabel.font = Resourses.Fonts.helveticaRegular(with: 15)
//        rightButtonLabel.text = title
        
        rightButtonIcon.translatesAutoresizingMaskIntoConstraints = false
        rightButtonIcon.image = Resourses.Images.Common.downArrow
//        rightButtonIcon.tintColor = UIColor(named: "active")
    }
}
