//
//  ViewController.swift
//  4.6 lesson
//
//  Created by adyl CEO on 29/01/2024.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    private var simpleCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 200)
        
        layout.minimumLineSpacing = 50
        layout.minimumInteritemSpacing = 0
        
        layout.scrollDirection = .horizontal
        
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        cv.register(CustomCollectionView.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    
    private let sortLabel: UILabel = {
        let label = UILabel()
        label.text = "Sort By"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let mostPopularLabel: UILabel = {
        let label = UILabel()
        label.text = "Most Popular"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#D33B3B")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let verticalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2)  - 40, height: 200)
        
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        
        
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(VerticalUICollection.self, forCellWithReuseIdentifier: "verticalCell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        verticalCollectionView.layer.shadowColor = UIColor.black.cgColor
        verticalCollectionView.layer.shadowOpacity = 0.5
        verticalCollectionView.layer.shadowOffset = CGSize(width: 0, height: 4)
        verticalCollectionView.layer.shadowRadius = 8
        
        
        view.addSubview(simpleCollectionView)
        view.addSubview(verticalCollectionView)
        
        verticalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
        
        
        simpleCollectionView.dataSource = self
        simpleCollectionView.layer.cornerRadius = 16
        simpleCollectionView.backgroundColor = UIColor(hex: "#262626")
        
        verticalCollectionView.layer.cornerRadius = 16
        
        view.addSubview(sortLabel)
        NSLayoutConstraint.activate([
            sortLabel.topAnchor.constraint(equalTo: simpleCollectionView.bottomAnchor, constant: 25),
            sortLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            simpleCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            simpleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            simpleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            simpleCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            
            verticalCollectionView.topAnchor.constraint(equalTo: sortLabel.bottomAnchor, constant: 20),
            verticalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verticalCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
        
        
        view.addSubview(mostPopularLabel)
        NSLayoutConstraint.activate([
            mostPopularLabel.topAnchor.constraint(equalTo: simpleCollectionView.bottomAnchor, constant: 37),
            mostPopularLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        //        simpleCollectionView.dataSource = self
        //        simpleCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.backgroundColor = UIColor(hex: "#262626")
        verticalCollectionView.backgroundColor = UIColor(hex: "#262626")
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == simpleCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionView
            cell?.setImage(image: "food1")
            
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "verticalCell", for: indexPath) as? VerticalUICollection
            cell?.backgroundColor = UIColor(hex: "#262626")

            let imageNames = ["food2", "food3", "food4", "food5", "food6", "food3"]
            let titles = ["Salad", "Salad Fish", "Stake", "Pizza", "Vegetable", "Salad"]

            cell?.configure(with: imageNames[indexPath.item], title: titles[indexPath.item])

            return cell ?? UICollectionViewCell()
        }
    }
}



extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
