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
    
    enum Overview {
        static var allWorkoutsButton = "All workouts"
    }
    
    enum Session {
        static let navBarStart = "Start  "
        static let navBarPause = "Pause"
        static let navBarFinish = "Finish"
        
        static let elapsedTime = "Elapsed Time"
        static let remainingTime = "Remaining Time"
        static let completed = "Completed"
        static let remaining = "Remaining"
        
        static let workoutStats = "Workout stats"
        static let averagePace = "Average pace"
        static let heartRate = "Heart rate"
        static let totalDistance = "Total distance"
        static let totalSteps = "Total steps"
        
        static let stepsCounter = "Steps Counter"
    }
    
    enum Progress {
        static let navBarLeft = "Export"
        static let navBarRight = "Details"
        
        static let dailyPerformance = "Daily performance"
        static let last7Days = "Last 7 days"
        
        static let monthlyPerformance = "Monthly performance"
        static let last10Months = "Last 10 months"
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
    enum Images {
        enum TabBar {
            static var overview = UIImage(named: "overview")?.resized(to: CGSize(width: 22, height: 22))
            static var progress = UIImage(named: "progress")?.resized(to: CGSize(width: 22, height: 22))
            static var settings = UIImage(named: "settings")?.resized(to: CGSize(width: 22, height: 22))
            static var session = UIImage(named: "session")?.resized(to: CGSize(width: 22, height: 22))
        }
        
        enum SessionView {
            static var heartRate = UIImage(named: "heartRate")?.resized(to: CGSize(width: 22, height: 22))
            static var route = UIImage(named: "route")?.resized(to: CGSize(width: 22, height: 22))
            static var speedometr = UIImage(named: "speedometr")?.resized(to: CGSize(width: 22, height: 22))
            static var steps = UIImage(named: "steps")?.resized(to: CGSize(width: 22, height: 22))
        }
        
        enum Common {
            static var downArrow = UIImage(systemName: "chevron.down")?.resized(to: CGSize(width: 20, height: 25))
            static var circlePlus = UIImage(systemName: "plus.circle.fill")?.resized(to: CGSize(width: 40, height: 40))?.withTintColor(UIColor(named: "active") ?? .systemGray)
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
