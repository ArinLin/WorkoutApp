//
//  ProgressView.swift
//  WorkoutApp
//
//  Created by Arina on 27.06.2023.
//

import UIKit

extension TimerView {
    final class ProgressView: UIView {
        func drawProgress(percent: CGFloat) {
            // UIScreen.main.bounds.width - ширина экрана
            // отступы 15 + отступ самого таймер вью 40
            // умножаем на 2, потому что с обеих сторон
            let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2 // ширина нашего фрейма6 где будет отрисовываться круг
            
            // 2. определяем радиус
            let radius = circleFrame / 2
            
            // 3. определяем центр
            let center = CGPoint(x: radius, y: radius)
            
            // 4. определяем начало и конец
            let startAngle = -CGFloat.pi * 7/6
            let endAngle = CGFloat.pi * 1/6
            
            // с помощью UIBezierPath определяем путь по которому должен двигаться настроенный лейер, а Layer настраиваем как должно выглядить
            let circlePath = UIBezierPath(arcCenter: center, // центр дуги
                                          radius: radius, // радиус
                                          startAngle: startAngle, // начало с точки зрения угла
                                          endAngle: endAngle, // конец с точки зрения угла
                                          clockwise: true) // по часовой стрелке или против происходит отрисовка (в нашем случае по часовой стрелке заполняем круг)
            
            // создаем лейер, который будет двигаться по пути и отрисовывать прогресс
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath // указываем путь
            circleLayer.strokeColor = UIColor(named: "active")?.cgColor // указываем цвет
            circleLayer.lineWidth = 20 // ширина заполнения
            circleLayer.strokeEnd = percent // процент заполненности круга
            circleLayer.fillColor = UIColor.clear.cgColor // тот цвет, который будет находится внутри этого круга (в нашем случае прозрачный)
            circleLayer.lineCap = .round // запоолнение должно быть с закругленными краями
            
            // устанавливаем наш созданный лейер в основной лейер ProgressView
            layer.addSublayer(circleLayer)
        }
    }
}
