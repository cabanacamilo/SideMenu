//
//  HomeViewController.swift
//  SideMenu
//
//  Created by Camilo Cabana on 20/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var settingsLauncher: SideMenuController = {
        let sideMenu = SideMenuController()
        sideMenu.homeController = self
        return sideMenu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sideMenuButton(_ sender: UIBarButtonItem) {
        settingsLauncher.showSideMenu()
    }
    
    func showControllerForSideMenu(goTo: String) {
        performSegue(withIdentifier: goTo, sender: nil)
    }
    
//    @objc func showSideMenuGesture(sender: UIPanGestureRecognizer) {
//        let sideMenuWidth = view.frame.width * 0.8
//        let translation = sender.translation(in: view)
//        if let window = (UIApplication.shared.windows.filter {$0.isKeyWindow}.first) {
//            window.addSubview(blackVIew)
//            window.addSubview(sideMenuView)
//            switch sender.state {
//            case .began, .changed:
//                if translation.x <= view.frame.width * 0.8 {
//                    sideMenuView.frame = CGRect(x: -sideMenuWidth + translation.x, y: 0, width: sideMenuWidth, height: self.view.frame.height)
//                    blackVIew.alpha = translation.x/sideMenuWidth
//                }
//            case .ended:
//                UIView.animate(withDuration: 0.3) {
//                    if translation.x > (sideMenuWidth * 0.35) {
//                        self.sideMenuView.frame = CGRect(x: 0, y: 0, width: sideMenuWidth, height: self.view.frame.height)
//                        self.blackVIew.alpha = 1
//                    } else {
//                        self.sideMenuView.frame = CGRect(x: -sideMenuWidth, y: 0, width: sideMenuWidth, height: self.view.frame.height)
//                        self.blackVIew.alpha = 0
//                    }
//                }
//            default:
//                break
//            }
//            window.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dismissSideMenuGesture)))
//        }
//    }
//
//    @objc func dismissSideMenuGesture(sender: UIPanGestureRecognizer) {
//        let sideMenuWidth = view.frame.width * 0.8
//        let translation = sender.translation(in: view)
//        switch sender.state {
//        case .began, .changed:
//            if translation.x <= 0  {
//                sideMenuView.frame = CGRect(x: translation.x, y: 0, width: sideMenuWidth, height: self.view.frame.height)
//                blackVIew.alpha = 1 + translation.x/sideMenuWidth
//            }
//        case .ended:
//            UIView.animate(withDuration: 0.3) {
//                if translation.x > -(sideMenuWidth * 0.7) {
//                    self.sideMenuView.frame = CGRect(x: 0, y: 0, width: sideMenuWidth, height: self.view.frame.height)
//                    self.blackVIew.alpha = 1
//                } else {
//                    self.sideMenuView.frame = CGRect(x: -sideMenuWidth, y: 0, width: sideMenuWidth, height: self.view.frame.height)
//                    self.blackVIew.alpha = 0
//                }
//            }
//            break
//        default:
//            break
//        }
//    }

}
