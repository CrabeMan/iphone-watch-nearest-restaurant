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
            
            listRestaurantController.tabBarItem = UITabBarItem(title: NSLocalizedString("Restaurant", comment: "restaurant title"), image: nil, selectedImage: nil)
            mapController.tabBarItem = UITabBarItem(title: NSLocalizedString("Maps", comment: "maps title"), image: nil, selectedImage: nil)
            return tabBar
        }
    }
}
