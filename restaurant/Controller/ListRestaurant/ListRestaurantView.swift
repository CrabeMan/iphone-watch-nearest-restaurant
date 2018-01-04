import Foundation


protocol ListRestaurantView : BaseView {
    func startLoading();
    func finishLoading();
    func setListRestaurant(res : [Restaurant]);
    func setEmptyRestaurant();
    
}
