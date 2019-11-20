//
//  HomeViewController.swift
//  SideMenu
//
//  Created by Camilo Cabana on 20/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var sideMenuView: UIView!
    let blackVIew = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuView.frame = CGRect(x: -view.frame.width * 0.8, y: 0, width: view.frame.width * 0.8, height: view.frame.height)
        blackVIew.frame = view.frame
        blackVIew.backgroundColor = UIColor(white: 0, alpha: 0.8)
        blackVIew.alpha = 0
        blackVIew.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissSideMenu)))
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(showSideMenuGesture)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(goToProfile), name: NSNotification.Name(rawValue: "GoToProfile"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(goToSettings), name: NSNotification.Name(rawValue: "GoToSettings"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(goToSignOut), name: NSNotification.Name(rawValue: "GoToSignOut"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(dismissSideMenu), name: NSNotification.Name(rawValue: "DismissSideMenu"), object: nil)
    }
    
    @objc func goToProfile() {
        performSegue(withIdentifier: "Profile", sender: nil)
    }
    
    @objc func goToSettings() {
        performSegue(withIdentifier: "Settings", sender: nil)
    }
    
    @objc func goToSignOut() {
        performSegue(withIdentifier: "SignOut", sender: nil)
    }
    
    @IBAction func sideMenuButton(_ sender: UIBarButtonItem) {
        showSideMenu()
    }
    
    func showSideMenu() {
        if let window = (UIApplication.shared.windows.filter {$0.isKeyWindow}.first) {
            window.addSubview(blackVIew)
            window.addSubview(sideMenuView)
            UIView.animate(withDuration: 0.3) {
                self.blackVIew.alpha = 1
                self.sideMenuView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 0.8, height: self.view.frame.height)
            }
            window.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dismissSideMenuGesture)))
        }
    }
    
    @objc func dismissSideMenu() {
        UIView.animate(withDuration: 0.35) {
            self.blackVIew.alpha = 0
            self.sideMenuView.frame = CGRect(x: -self.view.frame.width * 0.8, y: 0, width: self.view.frame.width * 0.8, height: self.view.frame.height)
        }
    }
    
    @objc func showSideMenuGesture(sender: UIPanGestureRecognizer) {
        let sideMenuWidth = view.frame.width * 0.8
        let translation = sender.translation(in: view)
        if let window = (UIApplication.shared.windows.filter {$0.isKeyWindow}.first) {
            window.addSubview(blackVIew)
            window.addSubview(sideMenuView)
            switch sender.state {
            case .began, .changed:
                if translation.x <= view.frame.width * 0.8 {
                    sideMenuView.frame = CGRect(x: -sideMenuWidth + translation.x, y: 0, width: sideMenuWidth, height: self.view.frame.height)
                    blackVIew.alpha = translation.x/sideMenuWidth
                }
            case .ended:
                UIView.animate(withDuration: 0.3) {
                    if translation.x > (sideMenuWidth * 0.35) {
                        self.sideMenuView.frame = CGRect(x: 0, y: 0, width: sideMenuWidth, height: self.view.frame.height)
                        self.blackVIew.alpha = 1
                    } else {
                        self.sideMenuView.frame = CGRect(x: -sideMenuWidth, y: 0, width: sideMenuWidth, height: self.view.frame.height)
                        self.blackVIew.alpha = 0
                    }
                }
            default:
                break
            }
            window.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dismissSideMenuGesture)))
        }
    }
    
    @objc func dismissSideMenuGesture(sender: UIPanGestureRecognizer) {
        let sideMenuWidth = view.frame.width * 0.8
        let translation = sender.translation(in: view)
        switch sender.state {
        case .began, .changed:
            if translation.x <= 0  {
                sideMenuView.frame = CGRect(x: translation.x, y: 0, width: sideMenuWidth, height: self.view.frame.height)
                blackVIew.alpha = 1 + translation.x/sideMenuWidth
            }
        case .ended:
            UIView.animate(withDuration: 0.3) {
                if translation.x > -(sideMenuWidth * 0.7) {
                    self.sideMenuView.frame = CGRect(x: 0, y: 0, width: sideMenuWidth, height: self.view.frame.height)
                    self.blackVIew.alpha = 1
                } else {
                    self.sideMenuView.frame = CGRect(x: -sideMenuWidth, y: 0, width: sideMenuWidth, height: self.view.frame.height)
                    self.blackVIew.alpha = 0
                }
            }
            break
        default:
            break
        }
    }

}
