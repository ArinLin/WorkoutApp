//
//  SectionHeaderView.swift
//  WorkoutApp
//
//  Created by Arina on 11.07.2023.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let reuseID = "SectionHeaderView"
    
    private let title: UILabel = {
        let lable = UILabel()
        lable.font = Resourses.Fonts.helveticaRegular(with: 13)
        lable.textColor = UIColor(named: "inactive")
        lable.textAlignment = .center
        return lable
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
    
    func configure(withTitle: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM"
        self.title.text = dateFormatter.string(from: withTitle).uppercased()
    }
}

private extension SectionHeaderView {
    func setupViews() {
        addSubview(title)
    }
    
    func constraintViews() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureAppearance() {}
}

