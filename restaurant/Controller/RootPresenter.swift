import UIKit

class RootPresenter: BasePresenter {
    
    internal let listRepository: ApiRestaurantRepository
    weak internal var rootView : RootView?
    
    internal let limit = 30
    
    init(repo : Repository) {
        self.listRepository = repo as! ApiRestaurantRepository
    }
    
    func attachView(view:RootView) {
        self.rootView = view
    }
    
    func detachView() {
        self.rootView = nil;
    }
}
