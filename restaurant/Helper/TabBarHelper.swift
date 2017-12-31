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
            
            let mapController = UINavigationController(rootViewController: MapViewController())
            
            // Tab Bar
            let tabBar = UITabBarController()
            tabBar.setViewControllers([listRestaurantController, mapController], animated: true)
            
            // Tar Bar Items
            listRestaurantController.tabBarItem = UITabBarItem(title: "Restaurant", image: nil, selectedImage: nil)
            mapController.tabBarItem = UITabBarItem(title: "Maps", image: nil, selectedImage: nil)
            return tabBar
        }
    }
}
