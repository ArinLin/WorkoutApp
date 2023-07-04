//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Arina on 27.06.2023.
//

import UIKit

// enum для отображения состояний нашего таймера
enum TimerState {
    case isRuning
    case isPaused
    case isStopped
}

final class TimerView: BaseInfoView {
    
    private let elapsedTimeLable: UILabel = {
        let label = UILabel()
        label.text = Resourses.Session.elapsedTime
        label.font = Resourses.Fonts.helveticaRegular(with: 14)
        label.textColor = UIColor(named: "maingrey")
        label.textAlignment = .center
        return label
    }()
    
    private let elapsedTimeValueLable: UILabel = {
        let label = UILabel()
        label.font = Resourses.Fonts.helveticaRegular(with: 46)
        label.textColor = UIColor(named: "inactive")
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeLable: UILabel = {
        let label = UILabel()
        label.text = Resourses.Session.remainingTime
        label.font = Resourses.Fonts.helveticaRegular(with: 13)
        label.textColor = UIColor(named: "maingrey")
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeValueLable: UILabel = {
        let label = UILabel()
        label.font = Resourses.Fonts.helveticaRegular(with: 13)
        label.textColor = UIColor(named: "inactive")
        label.textAlignment = .center
        return label
    }()
    
    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    // помимо этого стека, в который мы поместим PersentView, нужно сделать еще 3 вью: completed, remaining
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.spacing = 25
        return view
    }()
    
    // создаем 3 новые вью к предыдущему стеку
    private let completedPercentView = PercentView()
    private let remainigPercetnView = PercentView()
    private let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "maingrey")
        return view
    }()
    
//    private let progressView: ProgressView = {
//        let view = ProgressView()
//        view.drawProgress(percent: 0.0)
//        return view
//    }()
    private let progressView = ProgressView()
    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    public var state: TimerState = .isStopped // делаем public, чтобы можно было вызывать откуда угодно, по дефолту таймер остановлен
    
    var callBack: (() -> Void)?
    
    // добавляем конфигуратор, который отрисовывает состояние таймера в зависимости от входящих параметров
    func configure(duration: Double, progress: Double) {
        timerDuration = duration
        
        let tempCurrentValue = progress > duration ? duration : progress
        
        let goalValueDevider = duration == 0 ? 1 : duration
        
        let percent = tempCurrentValue / goalValueDevider
        
        // делаем округленные проценты, которые будут отображаться внизу
        let roundedPercent = Int(round (percent * 100))
        
        elapsedTimeValueLable.text = getDisplayedString(from: Int(tempCurrentValue))
        remainingTimeValueLable.text = getDisplayedString(from: Int (duration) - Int (tempCurrentValue))
        
        completedPercentView.configure(withTitle: "COMPLETED", withValue: roundedPercent)
        remainigPercetnView.configure(withTitle: "REMAINING", withValue: 100 - roundedPercent)
        
        progressView.drawProgress(percent: CGFloat(percent)) // передаем во вью процент
    }
    
    func startTimer() {
        timer.invalidate() // каждый раз при запуске таймера, мы должны его инвалидить, чтобы убить предыдущий таймер и запустить новый
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01 // каждую милисекунду мы изменяем наше значение
            
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration // если прогресс больше чем длительность, то наш timerProgress должен стать максимальным
                timer.invalidate() // прерываем таймер
                self.callBack?() // таймер будет сброшен и сразу после этого, мы должны выполнить некое действие
            }
            // когда у нас происходит каждая итерация ьаймера, мы будем конфигурировать себя
            self.configure(duration: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        timer.invalidate()
        
        guard self.timerProgress > 0 else { return }
        // при стоп таймер срабатывает обратная отрисовка нашего startTimer() - ползунок бегает обратно и удаляет прогресс
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            //self.timerProgress -= 0.1 // каждую милисекунду мы изменяем наше значение
            
            //self.timerProgress -= 0.1 слишком медленная обратная анимация при больших значениях. Правильнее сделать через зависимость от timerDuration
            self.timerProgress -= self.timerDuration * 0.01
            
            if self.timerProgress <= 0 {
                self.timerProgress = 0 // timerProgress равен нулю, чтобы мы не выходили за пределы
                timer.invalidate() // прерываем таймер
            }
            // когда у нас происходит каждая итерация ьаймера, мы будем конфигурировать себя
            self.configure(duration: self.timerDuration, progress: self.timerProgress)
        })
    }
}

extension TimerView {
    override func setupViews() {
        super.setupViews()
        addSubview(progressView)
        
        [
            elapsedTimeLable,
            elapsedTimeValueLable,
            remainingTimeLable,
            remainingTimeValueLable
        ].forEach {
            timeStackView.addArrangedSubview($0) // каждый элемент, который будет в этом перечислении взят, будет установлен внутри нашего стеквью
        }
        
        addSubview(timeStackView)
        
        [
            completedPercentView,
            bottomSeparatorView,
            remainigPercetnView
        ].forEach {
            bottomStackView.addArrangedSubview($0) // каждый элемент, который будет в этом перечислении взят, будет установлен внутри нашего стеквью
        }
        addSubview(bottomStackView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
        ])
        
        timeStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
        ])
        
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 175),
            
            bottomSeparatorView.widthAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
    }
}
// делаем функцию, которая будет осчитывать время
private extension TimerView {
    func getDisplayedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondsStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)": "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0
        ? [minutesStr, secondsStr].joined (separator: ":")
        : [hoursStr, minutesStr, secondsStr].joined(separator: ":")
    }
}
