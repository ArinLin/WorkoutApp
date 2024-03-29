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
            // чтобы у нас не было дерганой анимации при отрисовке таймера (т.к каждую секунду один слой накладывается на другой), мы должны удалять предыдущии слои
            layer.sublayers?.removeAll() // удаляем все предыдущие слои
            
            
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
            
            // создаем дефолтный лейер, который будет отображаться серым
            let defaultCircleLayer = CAShapeLayer()
            defaultCircleLayer.path = circlePath.cgPath // указываем путь
            defaultCircleLayer.strokeColor = UIColor(named: "maingrey")?.cgColor // указываем цвет
            defaultCircleLayer.lineWidth = 20 // ширина заполнения
            defaultCircleLayer.strokeEnd = 1 // процент заполненности круга (дефолтный серый всегда заполняет круг на 100%, поэтому передаем 1)
            defaultCircleLayer.fillColor = UIColor.clear.cgColor // тот цвет, который будет находится внутри этого круга (в нашем случае прозрачный)
            defaultCircleLayer.lineCap = .round // запоолнение должно быть с закругленными краями
            
            // создаем лейер, который будет двигаться по пути и отрисовывать прогресс
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath // указываем путь
            circleLayer.strokeColor = UIColor(named: "active")?.cgColor // указываем цвет
            circleLayer.lineWidth = 20 // ширина заполнения
            circleLayer.strokeEnd = percent // процент заполненности круга
            circleLayer.fillColor = UIColor.clear.cgColor // тот цвет, который будет находится внутри этого круга (в нашем случае прозрачный)
            circleLayer.lineCap = .round // запоолнение должно быть с закругленными краями
            
            
            // создаем белую точку
            // 8/6 - полный путь НАШЕГО круга
            // 6/6 - по оси х - это ровно половина ЦЕЛОГО круга
            let dotAngle = CGFloat.pi * (7 / 6 - (8 / 6 * percent))
            // определяем начало и конец для точки (т.к это точка, то начало и конец равны)
            let dotPoint = CGPoint(x: cos(-dotAngle) * radius + center.x,
                                        y: sin(-dotAngle) * radius + center.y)
            // создаем путь для точки
            let dotPath = UIBezierPath ()
            dotPath.move(to: dotPoint) // устанавливаем дефолтную точку -- это dotPoint
            dotPath.addLine(to: dotPoint) // двигаемся прямой линией до dotPoint (движения не присходит, т.к мы рисуем точку)
            
            // создаем слой, который будет рисовать большую синюю точку
            let bigDotLayer = CAShapeLayer ()
            bigDotLayer.path = dotPath.cgPath // говорим какой путь
            bigDotLayer.strokeColor = UIColor(named: "active")?.cgColor // цвет самой точки
            bigDotLayer.fillColor = UIColor.clear.cgColor // цвет бекграунда, который полностью заполняет границы нашего cgColor
            bigDotLayer.lineCap = .round // делаем закругенные края
            bigDotLayer.lineWidth = 20 // ширина линии
            
            // создаем слой, который будет рисовать эту точку
            let dotLayer = CAShapeLayer ()
            dotLayer.path = dotPath.cgPath // говорим какой путь
            dotLayer.strokeColor = UIColor.white.cgColor // цвет самой точки
            dotLayer.fillColor = UIColor.clear.cgColor // цвет бекграунда, который полностью заполняет границы нашего cgColor
            dotLayer.lineCap = .round // делаем закругенные края
            dotLayer.lineWidth = 8 // ширина линии
            
            
            // создаем черточки в нашем полукруге
            let barsFrame = UIScreen.main.bounds.width - (15 + 40 + 25) * 2
            let barsRadius = barsFrame / 2
            
            let barsPath = UIBezierPath(arcCenter: center,
                                        radius: barsRadius,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
            
            let barsLayer = CAShapeLayer()
            barsLayer.path = barsPath.cgPath
            barsLayer.fillColor = UIColor.clear.cgColor
            barsLayer.strokeColor = UIColor.clear.cgColor
            barsLayer.lineWidth = 6
            
            // точки начала и конца каждой черточки
            let startBarRadius = barsRadius - barsLayer.lineWidth / 2
            let endBarRadius = startBarRadius + 6
            
            // создаем переменную angle - угол
            var angle: CGFloat = 7 / 6 // значение по умолчанию -- угол начала
            (1...9).forEach { _ in // диапазон по количеству черточек
                let barAngle = CGFloat.pi * angle
                let startBarPoint = CGPoint(
                    x: cos (-barAngle) * startBarRadius + center.x,
                    y: sin(-barAngle) * startBarRadius + center.y
                )
                
                let endBarPoint = CGPoint (
                    x: cos (-barAngle) * endBarRadius + center.x,
                    y: sin(-barAngle) * endBarRadius + center.y
                )
                
                let barPath = UIBezierPath()
                barPath.move(to: startBarPoint)
                barPath.addLine(to: endBarPoint)
                
                // создаем слой -- тот визуал, который будет отрисован
                let barLayer = CAShapeLayer ( )
                barLayer.path = barPath.cgPath
                barLayer.fillColor = UIColor.clear.cgColor
                barLayer.strokeColor = angle >= (7 / 6 - (8 / 6 * percent)) ? UIColor(named: "active")?.cgColor : UIColor(named: "maingrey")?.cgColor
                barLayer.lineCap = .round
                barLayer.lineWidth = 4
                
                barsLayer.addSublayer(barLayer)
                
                angle -= 1 / 6
            }
                
            
            // устанавливаем наш созданный лейер в основной лейер ProgressView
            // важен порядок добавления на основной слой, потому что дефолтный круг лежит под синим
            layer.addSublayer(defaultCircleLayer)
            layer.addSublayer(circleLayer)
            layer.addSublayer(bigDotLayer)
            layer.addSublayer(dotLayer)
            layer.addSublayer(barsLayer)
        }
    }
}
