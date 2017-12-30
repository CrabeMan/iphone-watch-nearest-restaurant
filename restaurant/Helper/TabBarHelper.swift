//
//  TabBarHelper.swift
//  restaurant
//
//  Created by Mohson Butt [DAN-PARIS] on 30/12/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import UIKit

class TabBarHelper{
    
    static var mainTabBar: UITabBarController {
        get {
            // ViewControllers
            let listRestaurantController = UINavigationController(rootViewController: ListRestaurantViewController())
            
            // Tab Bar
            let tabBar = UITabBarController()
            tabBar.setViewControllers([listRestaurantController], animated: true)
            
            // Tar Bar Items
            listRestaurantController.tabBarItem = UITabBarItem(title: "Restaurant", image: nil, selectedImage: nil)
            
            return tabBar
        }
    }
}
