import UIKit

class RootViewController: UITabBarController {
    
    var listRestaurantController: ListRestaurantViewController? = nil
    var mapController: MapViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listRestaurantController = ListRestaurantViewController()
        mapController = MapViewController()
        
        let listRestaurantNavController = UINavigationController(rootViewController: listRestaurantController!)
        let mapNavController = UINavigationController(rootViewController: mapController!)
        
        setViewControllers([listRestaurantNavController, mapNavController], animated: true)
        
        listRestaurantNavController.tabBarItem = UITabBarItem(title: "Restaurant", image: nil, selectedImage: nil)
        mapNavController.tabBarItem = UITabBarItem(title: "Maps", image: nil, selectedImage: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
