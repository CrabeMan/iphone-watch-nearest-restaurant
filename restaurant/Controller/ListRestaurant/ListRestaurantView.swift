//
//  ListRestaurantView.swift
//  restaurant
//
//  Created by Mohson Butt [DAN-PARIS] on 31/12/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import Foundation


protocol ListRestaurantView : BaseView {
    func startLoading();
    func finishLoading();
    func setListRestaurant(res : [Restaurant]);
    func setEmptyRestaurant();
    
}
