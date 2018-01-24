import UIKit

class MapViewPresenter: RootPresenter {
    public func getNearestRest(lat: String, long: String, onEnd: @escaping () -> (Void)) {
        self.rootView?.startLoading();
        self.listRepository.getNearest(lat: lat, long: long) { (result) in
            
            guard let data = result.success else {
                if let error = result.error {
                    self.rootView?.setEmptyRestaurant()
                    self.rootView?.finishLoading()
                }
                return
            }
            self.rootView?.addListRestaurant(res: data)
            onEnd()
        }
    }
}
