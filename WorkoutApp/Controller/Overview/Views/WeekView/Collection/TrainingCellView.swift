//
//  TrainingCellView.swift
//  WorkoutApp
//
//  Created by Arina on 11.07.2023.
//

import UIKit

enum CellRoundedType {
    case top, bottom, all, notRounded
}

final class TrainingCellView: UICollectionViewCell {
    static let reuseID = "TrainingCellView"
    
    private let checkmarkView: UIImageView = {
        let view = UIImageView()
        view.image = Resourses.Images.Overview.circle
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()
    
    private let title: UILabel = {
        let lable = UILabel()
        lable.font = Resourses.Fonts.helveticaRegular(with: 17)
        lable.textColor = UIColor(named: "inactive")
        return lable
    }()
    
    private let subtitle: UILabel = {
        let lable = UILabel()
        lable.font = Resourses.Fonts.helveticaRegular(with: 13)
        lable.textColor = UIColor(named: "inactive")
        return lable
    }()
    
    private let rightArrowView: UIImageView = {
        let view = UIImageView()
        view.image = Resourses.Images.Overview.rightArrow
        view.tintColor = UIColor(named: "inactive")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    func configure(withTitle: String, subtitle: String, isDone: Bool, roundedType: CellRoundedType) {
        self.title.text = withTitle.uppercased()
        self.subtitle.text = subtitle
        
        checkmarkView.image = isDone ? Resourses.Images.Overview.checked : Resourses.Images.Overview.circle
        
        switch roundedType {
        case .all: self.roundCorners([.allCorners], radius: 5)
        case .bottom: self.roundCorners([.bottomLeft, .bottomRight], radius: 5)
        case .top: self.roundCorners([.topLeft, .topRight], radius: 5)
        case .notRounded: self.roundCorners([.allCorners], radius: 0)
        }
    }
}

private extension TrainingCellView {
    func setupViews() {
        addSubview(checkmarkView)
        addSubview(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        addSubview(rightArrowView)
    }
    
    func constraintViews() {
        checkmarkView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        rightArrowView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.heightAnchor.constraint(equalToConstant: 28),
            checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -15),
            
            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrowView.heightAnchor.constraint(equalToConstant: 30),
            rightArrowView.widthAnchor.constraint(equalToConstant: 32),
            rightArrowView.leadingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
        
    }
    
    func configureAppearance() {
        backgroundColor = .white
//        layer.borderWidth = 1
//        layer.borderColor = UIColor(named: "maingrey")?.cgColor
    }
}


