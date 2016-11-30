//
//  TableViewController.swift
//  CEIOS
//
//  Created by SSd on 11/28/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,UITabBarControllerDelegate  {

   override func viewDidLoad() {
    super.viewDidLoad()
    
    //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
    //self.delegate = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        // Create Tab one
        let tabOne = Tab1ViewController()
        let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
    
        tabOne.tabBarItem = tabOneBarItem
    
    
        // Create Tab two
        let tabTwo = Tab2ViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
    
        tabTwo.tabBarItem = tabTwoBarItem2
    
        
        //self.viewControllers = [tabOne, tabTwo]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}

