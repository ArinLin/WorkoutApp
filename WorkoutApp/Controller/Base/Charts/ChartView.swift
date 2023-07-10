//
//  ChartView.swift
//  WorkoutApp
//
//  Created by Arina on 09.07.2023.
//

import UIKit

final class ChartView: BaseView {
    
    private let yAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "maingrey")
        return view
    }()
    
    private let xAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "maingrey")
        return view
    }()
    
    
    func configure(withData: [ChartsView.Data]) {
        layoutIfNeeded()
//        addDashLine(at: 100)
        addDashLinesToY()
    }
}

extension ChartView {
    override func setupViews() {
        super.setupViews()
        
        addSubview(yAxisSeparator)
        addSubview(xAxisSeparator)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        yAxisSeparator.translatesAutoresizingMaskIntoConstraints = false
        xAxisSeparator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            yAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparator.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeparator.widthAnchor.constraint(equalToConstant: 1),
            
            xAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}
// создаем расширение для пунктирных линий
private extension ChartView {
    // функция для добавления пунктирных линий по оси y, чтобы не проставлять вручную
    func addDashLinesToY (with counts: Int? = nil) {
        (0..<10).map { CGFloat ($0) }.forEach {
            //addDashLine(at: bounds.height * 0.1 * $0) // когда умнощаем на 0.1, то мы берем 10% от высоты, а умножая на $0, увеличиваем этот процент
            addDashLine(at: bounds.height / 9 * $0) // всю высоту мы поделили на 9 отрезков, т.к какие бы цифры у нас не стояли по оси y, у нас всегда 9 отрезков
        }
    }
    
    
    
    func addDashLine(at yPosition: CGFloat) {
        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: bounds.width, y: yPosition)
        
        // создаем путь, на котором будет рисоваться слой. Эта линия не имет никакого цвета, никакого представления, а просто определяет путь
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        // оформили слой, но нам нужен путь, на котором он будет рисоваться
        // это слой, который имеет визуальное представление и накладывается на путь
        let dashLine = CAShapeLayer() // создаем саму пунктирную линию и применяем к ней модификаторы
        dashLine.path = dashPath
        dashLine.strokeColor = UIColor(named: "maingrey")?.cgColor
        dashLine.lineWidth = 1
        dashLine.lineDashPattern = [6, 3] // принимает в себя массив, указываем длину линии и длину пробела
        
        // на наше основное вью, нужно добавить сабвью в виде слоя, который мы только что создали
        layer.addSublayer(dashLine)
    }
}


