//
//  SideMenuHeader.swift
//  SideMenu
//
//  Created by Camilo Cabana on 25/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class SideMenuHeader: UICollectionViewCell {
    
    let headerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "PhotoUser")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Lastname"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerImage)
        addSubview(headerLabel)
        setHeaderLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHeaderLayout() {
        headerImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        headerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        headerImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        headerImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: headerImage.trailingAnchor, constant: 5).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
