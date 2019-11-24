//
//  SIdeMenuCell.swift
//  SideMenu
//
//  Created by Camilo Cabana on 24/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class SideMenuCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted == true {
                backgroundColor = .gray
                nameLabel.textColor = .white
                iconImageView.tintColor = .white
            } else {
                backgroundColor = .systemBackground
                nameLabel.textColor = .label
                iconImageView.tintColor = .label
            }
        }
    }
    
    var menu: SideMenuModel? {
        didSet {
            nameLabel.text = menu?.name
            if let iconName = menu?.icon {
                iconImageView.image = UIImage(systemName: iconName)
            }
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .label
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameLabel)
        addSubview(iconImageView)
        setLayout()
    }
    
    func setLayout() {
        iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
