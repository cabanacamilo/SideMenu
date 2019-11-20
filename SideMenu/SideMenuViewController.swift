//
//  SideMenuViewController.swift
//  SideMenu
//
//  Created by Camilo Cabana on 20/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let sideMenuOptions = ["Profile","Settings","Sign Out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenu", for: indexPath) as UITableViewCell
        cell.textLabel?.text = sideMenuOptions[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: NSNotification.Name("DismissSideMenu"), object: nil)
        if indexPath.row == 0 {
            NotificationCenter.default.post(name: NSNotification.Name("GoToProfile"), object: nil)
        }
        if indexPath.row == 1 {
            NotificationCenter.default.post(name: NSNotification.Name("GoToSettings"), object: nil)
        }
        if indexPath.row == 2 {
            NotificationCenter.default.post(name: NSNotification.Name("GoToSignOut"), object: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
