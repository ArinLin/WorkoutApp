//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Arina on 12.06.2023.
//

import UIKit
// массив для передачи в датасорс на отрисовку ячеек коллекции
struct TrainingData {
    struct Data {
        let title: String
        let subtitle: String
        let isDone: Bool
    }
    let date: Date
    let items: [Data]
}

class OverviewController: BaseController {
    
    private let navBar = OverviewNavBar()
    
    private var dataSource: [TrainingData] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout ()
        layout.minimumLineSpacing = 0
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configure()
        layoutViews()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews
//        cell.roundCorners([.allCorners], radius: 25)
//    }
}

// у нас есть baseController, в котором мы определили базовые методы. Теперь их нужно переопределить
extension OverviewController {
    override func addViews() {
        super.addViews()
        view.addSubview(navBar)
        view.addSubview(collectionView)
    }
    override func configure() {
        super.configure()
        
        // регистрируем ячейку
        collectionView.register(TrainingCellView.self, forCellWithReuseIdentifier: TrainingCellView.reuseID)
        // регистрируем хедер через forSupplementaryViewOfKind
        collectionView.register(SectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionHeaderView.reuseID)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        dataSource = [.init(date: Date(),
                            items: [
                                .init (title: "Warm Up Cardio",
                                       subtitle: "Stair Climber • 10 minutes",
                                       isDone: true),
                                .init(title: "High Intensity Cardio",
                                      subtitle: "Treadmill • 50 minutes",
                                      isDone: false),
                            ]),
                      .init(date: Date(),
                            items: [
                                .init(title: "Warm Up Cardio",
                                      subtitle: "Stair Climber • 10 minutes",
                                      isDone: false),
                                .init(title: "Chest Workout",
                                      subtitle: "Bench Press • 3 sets • 10 reps",
                                      isDone: false),
                                .init(title: "Tricep Workout",
                                      subtitle: "Overhead Extension • 5 sets • 8 reps",
                                      isDone: false),
                            ]),
                      .init(date: Date(),
                            items: [
                                .init(title: "Cardio Interval Workout",
                                      subtitle: "Treadmill • 60 minutes",
                                      isDone: false),
                            ])
        ]
        // когда данные получены из интернета, нужно обновить, чтобы они показались
        collectionView.reloadData()
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            collectionView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
// для получения данных
extension OverviewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource[section].items.count
    }
    
    // метод возвращает ячейки для нашей коллекции
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrainingCellView.reuseID, for: indexPath) as? TrainingCellView else { return UICollectionViewCell() }
        // чтобы в ячейки отображалась информация, которую мы задали выше
        let item = dataSource[indexPath.section].items[indexPath.row]
        
        // настраиваем закругление ячеек
        let roundedType: CellRoundedType
        // если ячейка и первая, и в то же время последняя, то она закругляется
        if indexPath.row == 0 && indexPath.row == dataSource[indexPath.section].items.count - 1 {
            roundedType = .all
        // если ячейка первая, то закругляется только верх
        } else if indexPath.row == 0 {
            roundedType = .top
        } else if indexPath.row == dataSource[indexPath.section].items.count - 1 {
            roundedType = .bottom
        } else {
            roundedType = .notRounded
        }
        
        cell.configure(withTitle: item.title, subtitle: item.subtitle, isDone: item.isDone, roundedType: roundedType)
        
        return cell
    }
    
    // настройки хедера
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.reuseID, for: indexPath) as? SectionHeaderView else { return UICollectionReusableView() }
        
        view.configure(withTitle: dataSource[indexPath.section].date)
        return view
    }
}
 
// для настройки внешнего вида
extension OverviewController: UICollectionViewDelegateFlowLayout {
    // для настройки размера ячейки
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width:collectionView.frame.width, height: 70) // ячейки такой же ширины, как и коллекция
    }
    
    // для настройки размера хедера
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width:collectionView.frame.width, height: 32)
    }
}
