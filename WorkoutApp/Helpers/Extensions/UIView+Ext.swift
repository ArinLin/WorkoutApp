//
//  UIView+Ext.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//


// Т.к мы не можем создать сепаратор наверху в навигации так же, как мы делаем это в таббаре, нам нужно кастомное расширение
import UIKit

extension UIView {
    func addBottomBorder(wuth color: UIColor, height: CGFloat) {
        // 1. Cоздаем сепаратор, который тоже является UIView
        let separator = UIView()
        // 2. Устанавливаем цвет сепаратора
        separator.backgroundColor = color
        // 3. Устанавливаем авторесайзинг макс на флексибл
        separator.autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight
        ]
        // 4. Устанавливаем frame для сепаратора
        separator.frame = CGRect(x: 0, // по x мы ничего не сдвигаем
                                 y: frame.height - height, // по y нам нужно от верхней границы view опуститься до нижней границы
                                 width: frame.width, // ширина на всю
                                 height: height) // переносим высоту из инициализатора
        // 5. Добавляем наше сабвью во вью
        addSubview(separator)
    }
    
    // Создадим эффект "моргания" кнопки (как и системной), чтобы юзер понимал, что кнопка была нажата
    func makeSystem(button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    // задаем анимацию для UIView
    @objc func handleIn() {
        UIView.animate(withDuration: 0.15) {self.alpha = 0.55} // берем элемент и делаем его на 55% прозрачнее -- это вся анимация
    }
    
    @objc func handleOut() {
        UIView.animate(withDuration: 0.15) {self.alpha = 1} // в этой анимации возвращаем состояние в исходное, ставим self.alpha = 1
    }
    
    // создаем метод, который будет закруглять углы у таблицы в Overview
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath (roundedRect: bounds,
                                 byRoundingCorners: corners,
                                 cornerRadii: CGSize(width: radius, height: radius))
    
        let borderLayer = CAShapeLayer ()
        borderLayer.frame = bounds
        borderLayer.path = path.cgPath
        borderLayer.strokeColor = UIColor(named: "maingrey")?.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.lineWidth = 1
        
        layer.addSublayer(borderLayer)
    }
}
