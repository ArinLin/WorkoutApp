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
        drawChart(withData: withData, topChartoffset: 10)
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
    func addDashLinesToY (with counts: Int = 10) {
        (0..<counts).map { CGFloat ($0) }.forEach {
            //addDashLine(at: bounds.height * 0.1 * $0) // когда умнощаем на 0.1, то мы берем 10% от высоты, а умножая на $0, увеличиваем этот процент
            addDashLine(at: bounds.height / CGFloat(counts) * $0) // всю высоту мы поделили на 9 отрезков, т.к какие бы цифры у нас не стояли по оси y, у нас всегда 9 отрезков
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
    
    // создаем метод, который будет рисовать нашу кривую по входящим данным
    func drawChart(withData: [ChartsView.Data], topChartoffset: Int?) {
        guard let maxValue = withData.sorted(by: { $0.dataValue > $1.dataValue }).first?.dataValue else { return }
        // получаем массив точек с 0 по максимально значение (в нашем случае по 9). Конкретные значения будут связаны с x
        let valuePoints = withData.enumerated().map { CGPoint(x: CGFloat ($0), y: CGFloat ($1.dataValue)) }
        let chartHeight = bounds.height / CGFloat(maxValue + (topChartoffset ?? 0)) // т.к наш максимальная точка не доходит до верхнего чарта на 10 поинтов
        
        let points = valuePoints.map {
            let x = bounds.width / CGFloat (valuePoints.count - 1) * $0.x // берем ширину экрана и делим на количество точек, (valuePoints -- количество точек в массиве). И умножая на порядковый номер координаты т.е * $0.x, получим отступ по оси x
            let y = bounds.height - $0.y * chartHeight
            return CGPoint(x: x, y: y)
        }
        
        // нужно пройтись UIBezierPath и отрисовать кривые
        let chartPath = UIBezierPath()
        chartPath.move(to: points[0]) // поставим первую точку
//        drawChartDot(atPoint: points[0])
        
        // пройдемся по всем точкам и отрисуем путь кривой. Ничего отрисовываться не будет, за отображение отвечает layer!
        points.forEach {
            chartPath.addLine(to: $0)
            drawChartDot(atPoint: $0)
        }
        
        // отрисовка самого графика
        let chartLayer = CAShapeLayer()
        chartLayer.path = chartPath.cgPath
        chartLayer.fillColor = UIColor.clear.cgColor
        chartLayer.strokeColor = UIColor(named: "active")?.cgColor
        chartLayer.lineWidth = 3
        chartLayer.strokeEnd = 1
        chartLayer.lineCap = .round
        chartLayer.lineJoin = .round
        
        layer.addSublayer(chartLayer)
    }
    
    // создаем функцию для отрисовки кругов на графике
    func drawChartDot(atPoint: CGPoint) {
        let dotPath = UIBezierPath()
        dotPath.move(to: atPoint) // начальная точка
        dotPath.addLine(to: atPoint) // прямая линия до этой точки
        
        let dotLayer = CAShapeLayer ()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = UIColor(named: "active")?.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 10
        
        layer.addSublayer(dotLayer)
    }
}


