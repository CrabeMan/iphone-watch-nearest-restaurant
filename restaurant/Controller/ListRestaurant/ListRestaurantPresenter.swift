import Foundation
import UIKit

class ListRestaurantPresenter: BasePresenter<ListRestaurantViewController, ApiRestaurantRepository> {
    
    func getNearestRest(lat: String, long: String) {
        self.view?.startLoading();
        
        self.repository.getNearest(lat: lat, long: long) { (result) in
            
            guard let data = result.success else {
                if let error = result.error {
                    print(error)
                    self.view?.setEmptyRestaurant()
                }
                return
            }
            
            self.view?.setListRestaurant(res: data)
        }
    }
        
}
