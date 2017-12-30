//
//  RestaurantRepository.swift
//  restaurant
//
//  Created by Mohson Butt [DAN-PARIS] on 30/12/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import Foundation

protocol RestaurantRepository{
    
    func findAll() -> [Restaurant]
    
    func find(id : NSInteger) -> Restaurant?
    
    func getNearest(lat : String, long : String) -> [Restaurant]
}
