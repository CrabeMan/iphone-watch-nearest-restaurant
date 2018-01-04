import UIKit


class BasePresenter<V, R> where V: BaseView, R: Repository {
    
    let repository: R
    var view : V?
    
    init(repo : R) {
        self.repository = repo
    }
    
    func attachView(view: V) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil;
    }
}
