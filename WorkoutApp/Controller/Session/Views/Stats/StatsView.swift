//
//  StatsView.swift
//  WorkoutApp
//
//  Created by Arina on 04.07.2023.
//

import UIKit

final class StatsView: BaseInfoView {
    
    private let stackStatView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        view.distribution = .fillEqually
        return view
    }()
    
//    override func setupViews() {
//        super.setupViews()
//
//        addSubview(itemView)
//
//        itemView.cunfigure(with: StatsItemView.StatsItem(image: Resourses.Images.SessionView.heartRate!,
//                                                         value: "155 bpm",
//                                                         title: Resourses.Session.heartRate.uppercased()))
//
//        itemView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            itemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
//        ])
//    }
    
    func configure(with itmes: [StatsItemDataSource]) {
            itmes.forEach {
                let itmeView = StatsItemView()
                itmeView.configure(with: $0)
                stackStatView.addArrangedSubview(itmeView)
            }
    }
}

extension StatsView {
    override func setupViews() {
        super.setupViews()

        addSubview(stackStatView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        stackStatView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackStatView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackStatView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackStatView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            stackStatView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
