//
//  RestaurantRepository.swift
//  restaurant
//
//  Created by Mohson Butt [DAN-PARIS] on 30/12/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import Foundation

protocol RestaurantRepository{
    
    func findAll(completion: (Result<[Restaurant]>) -> (Void))
    
    func find(id: String, completion: (Result<Restaurant>) -> (Void))
    
    func getNearest(lat: String, long: String, completion: @escaping (Result<[Restaurant]>) -> (Void)) 
}
