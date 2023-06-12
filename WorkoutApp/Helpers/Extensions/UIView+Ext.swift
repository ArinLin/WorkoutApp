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
}
