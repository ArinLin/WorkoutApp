//
//  Resourses.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit

enum Resourses {
    enum Strings {
        enum TabBar {
            static var overview = "Overview"
            static var progress = "Progress"
            static var settings = "Settings"
            static var session = "Session"
        }
    }
    
    enum Images {
        enum TabBar {
            static var overview = UIImage(named: "overview")?.resized(to: CGSize(width: 22, height: 22))
            static var progress = UIImage(named: "progress")?.resized(to: CGSize(width: 22, height: 22))
            static var settings = UIImage(named: "settings")?.resized(to: CGSize(width: 22, height: 22))
            static var session = UIImage(named: "session")?.resized(to: CGSize(width: 22, height: 22))
        }
    }
}
//MARK: Меняем размер загруженных иконок через растровые изображения, используя метод UIGraphicsImageRenderer
extension UIImage {
    func resized(to newSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let resizedImage = renderer.image { context in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
        return resizedImage
    }
}
// как это выглядит, если бы мы расписывали
//let originalImage = UIImage(named: "your_image_name.png")
//let newSize = CGSize(width: 50, height: 50)
//let resizedImage = originalImage?.resized(to: newSize)
