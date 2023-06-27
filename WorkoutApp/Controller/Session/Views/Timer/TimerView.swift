//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Arina on 27.06.2023.
//

import UIKit

final class TimerView: BaseInfoView {
    private let progressView: ProgressView = {
        let view = ProgressView()
        view.drawProgress(percent: 0)
        return view
    }()
}

extension TimerView {
    override func setupViews() {
        super.setupViews()
        addSubview(progressView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
//            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        progressView.backgroundColor = .red
    }
}
