//
//  CustomCollectionView.swift
//  4.6 lesson
//
//  Created by adyl CEO on 29/01/2024.
//

import UIKit

class CustomCollectionView: UICollectionViewCell {
    
    private let photoView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 16
        return image
    }()
    
    
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1.0]
        return gradientLayer
    }()
    
    private let imgLabel: UILabel = {
        let label = UILabel()
        label.text = "Salad"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let lilLabel: UILabel = {
        let label = UILabel()
        label.text = "12.432 recipes"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(photoView)
        contentView.layer.addSublayer(gradientLayer)
        contentView.addSubview(imgLabel)
        contentView.addSubview(lilLabel)
        contentView.backgroundColor = UIColor(hex: "#262626")
        
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            imgLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 135),
            imgLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            
            lilLabel.topAnchor.constraint(equalTo: imgLabel.topAnchor, constant: 35),
            lilLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        
        ])
        
        
    }
    
    func setImage(image: String) {
        photoView.image = UIImage(named: image)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
