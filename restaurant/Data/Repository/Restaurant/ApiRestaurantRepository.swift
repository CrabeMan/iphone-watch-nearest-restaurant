//
//  ApiRestaurantRepository.swift
//  restaurant
//
//  Created by Mohson Butt [DAN-PARIS] on 30/12/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import Foundation


class ApiRestaurantRepository: RestaurantRepository {
    func findAll() -> [Restaurant] {
        return [Restaurant(id: 1, title: "qqdqsd", address: "qsdqsdnqs", city: "qsdjqoisjd", country: "qsiodjqs", latitude: 12.898989, longitude: 12.89898, photo: "soidosifjds", cuisine: "djodijqsd", horaire: "dqdqsdqsd", note: 3, distance: 12.5)]
    }
    
    func find(id: NSInteger) -> Restaurant? {
        return nil;
    }
    
    func getNearest(lat: String, long: String) -> [Restaurant] {
         return [Restaurant(id: 1, title: "qqdqsd", address: "qsdqsdnqs", city: "qsdjqoisjd", country: "qsiodjqs", latitude: 12.898989, longitude: 12.89898, photo: "soidosifjds", cuisine: "djodijqsd", horaire: "dqdqsdqsd", note: 3, distance: 12.5)]
    }
    
    
 
}
