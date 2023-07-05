//
//  StatsView.swift
//  WorkoutApp
//
//  Created by Arina on 04.07.2023.
//

import UIKit

final class StatsView: BaseInfoView {
    
    private let itemView = StatsItemView()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(itemView)
        
        itemView.cunfigure(with: StatsItemView.StatsItem(image: Resourses.Images.SessionView.heartRate!,
                                                         value: "155 bpm",
                                                         title: Resourses.Session.heartRate.uppercased()))
        
        itemView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            itemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
        ])
    }
}
