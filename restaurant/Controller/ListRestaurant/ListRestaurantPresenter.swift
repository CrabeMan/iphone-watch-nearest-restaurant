import Foundation

class ListRestaurantPresenter: RootPresenter {
    
    private var currentPage = 0
    
    func getNextRestaurantPage(onEnd: @escaping () -> (Void)) {
        self.rootView?.startLoading();
        self.listRepository.findAll(limit: self.limit, offset: limit*self.currentPage) { (result) -> (Void) in
            guard let data = result.success else {
                if let error = result.error {
                    //self.listView?.setEmptyRestaurant()
                    self.rootView?.finishLoading()
                }
                return
            }
            
            self.currentPage += 1
            self.rootView?.addListRestaurant(res: data)
            onEnd()
        }
    }
}
