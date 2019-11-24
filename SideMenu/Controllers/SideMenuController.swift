//
//  SettingsLauncher.swift
//  SideMenu
//
//  Created by Camilo Cabana on 24/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class SideMenuController: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var homeController: HomeViewController?
    
    let blackVIew = UIView()
    let sideMenu: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    let menuInformation: [SideMenuModel] = {
        let profile = SideMenuModel(name: "Profile", icon: "person.fill")
        let settings = SideMenuModel(name: "Settings", icon: "pencil")
        let signOut = SideMenuModel(name: "SignOut", icon: "power")
        let menu = [profile,settings,signOut]
        return menu
    }()
    
    func showSideMenu() {
        if let window = (UIApplication.shared.windows.filter {$0.isKeyWindow}.first) {
            blackVIew.backgroundColor = UIColor(white: 0, alpha: 0.8)
            sideMenu.backgroundColor = .systemBackground
            blackVIew.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissSideMenu)))
            window.addSubview(blackVIew)
            window.addSubview(sideMenu)
            let witdth: CGFloat = window.frame.width * 0.7
            sideMenu.frame = CGRect(x: -witdth, y: 0, width: witdth, height: window.frame.height)
            blackVIew.frame = window.frame
            blackVIew.alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.blackVIew.alpha = 1
                self.sideMenu.frame = CGRect(x: 0, y: 0, width: witdth, height: window.frame.height)
            }
        }
    }
    
    @objc func dismissSideMenu() {
        UIView.animate(withDuration: 0.5) {
            self.blackVIew.alpha = 0
            if let window = (UIApplication.shared.windows.filter {$0.isKeyWindow}.first) {
                self.sideMenu.frame = CGRect(x: -window.frame.width, y: 0, width: self.sideMenu.frame.width, height: self.sideMenu.frame.height)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuInformation.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SideMenu", for: indexPath) as! SideMenuCell
        let menu = menuInformation[indexPath.row]
        cell.menu = menu
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackVIew.alpha = 0
            if let window = (UIApplication.shared.windows.filter {$0.isKeyWindow}.first) {
                self.sideMenu.frame = CGRect(x: -window.frame.width, y: 0, width: self.sideMenu.frame.width, height: self.sideMenu.frame.height)
            }
        }) { (completed) in
            let menu = self.menuInformation[indexPath.row]
            if menu.name != "SignOut" {
                self.homeController?.showControllerForSideMenu(goTo: menu.name)
            }
            
        }
    }
    
    override init() {
        super.init()
        sideMenu.dataSource = self
        sideMenu.delegate = self
        sideMenu.register(SideMenuCell.self, forCellWithReuseIdentifier: "SideMenu")
    }
}
