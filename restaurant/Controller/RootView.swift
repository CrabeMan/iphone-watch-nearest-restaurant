import UIKit

protocol RootView : BaseView {
    func startLoading();
    func finishLoading();
    func addListRestaurant(res : [Restaurant]);
    func setEmptyRestaurant();
}
