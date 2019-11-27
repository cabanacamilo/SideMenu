//
//  HomeViewController.swift
//  SideMenu
//
//  Created by Camilo Cabana on 20/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var sideMenu: SideMenuController = {
        let menu = SideMenuController()
        menu.homeController = self
        return menu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sideMenuButton(_ sender: UIBarButtonItem) {
        sideMenu.showSideMenu()
    }
    
    func showControllerForSideMenu(goTo: String) {
        performSegue(withIdentifier: goTo, sender: nil)
    }

}
