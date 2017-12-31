//
//  ListRestaurantPresenter.swift
//  restaurant
//
//  Created by Mohson Butt [DAN-PARIS] on 31/12/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import Foundation

class ListRestaurantPresenter: BasePresenter {
    
    private let listRepository: ApiRestaurantRepository
    weak private var listView : ListRestaurantView?
    
    init(repo : Repository) {
        self.listRepository = repo as! ApiRestaurantRepository
    }
    
    func attachView(view:ListRestaurantView){
        self.listView = view
    }
    
    func detachView() {
        self.listView = nil;
    }
    
    
    func getNearestRest(lat: String, long: String){
        
        self.listView?.startLoading();
        
        self.listRepository.getNearest(lat: lat, long: long) { (result) in
            
            guard let data = result.success else {
                if let error = result.error {
                    print(error)
                    self.listView?.setEmptyRestaurant()
                }
                return
            }
            
            self.listView?.setListRestaurant(res: data)
            
        }
    }
        
}
