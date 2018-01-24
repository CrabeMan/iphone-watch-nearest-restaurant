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
    
    private let limit = 30
    private var currentPage = 0
    
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
                    self.listView?.setEmptyRestaurant()
                    self.listView?.finishLoading()
                }
                return
            }
            
            self.listView?.addListRestaurant(res: data)
            
        }
    }
    
    func getNextRestaurantPage(onEnd: @escaping () -> (Void)) {
        self.listView?.startLoading();
        self.listRepository.findAll(limit: limit, offset: limit*currentPage) { (result) -> (Void) in
            guard let data = result.success else {
                if let error = result.error {
                    //self.listView?.setEmptyRestaurant()
                    self.listView?.finishLoading()
                }
                return
            }
            
            self.currentPage += 1
            self.listView?.addListRestaurant(res: data)
            onEnd()
        }
    }
        
}
