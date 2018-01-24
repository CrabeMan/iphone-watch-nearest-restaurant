//
//  ApiRestaurantRepository.swift
//  restaurant
//
//  Created by Mohson Butt [DAN-PARIS] on 30/12/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import Foundation


class ApiRestaurantRepository: RestaurantRepository {
    
    
    func findAll(completion: @escaping (Result<[Restaurant]>) -> (Void)){
        ApiService.callGet(url: Configuration.environment + "restaurant") { (message,data) in
            let result = Result<[Restaurant]>()
            do {
                if let jsonData = data {
                    
                    if let restaurant = try JSONDecoder().decode([Restaurant].self, from: jsonData) as [Restaurant]? {
                        
                        result.success = restaurant;
                        completion(result)
                    }
                }
            } catch {
                result.error = error
                completion(result)
            }
        }
    }
    
    
    func find(id: String, completion: (Result<Restaurant>) -> (Void)) {
        
    }
    
    func getNearest(lat: String, long: String, completion: @escaping (Result<[Restaurant]>) -> (Void)) {
        
        let params:[String : Any] = [
            "lat": lat,
            "lon": long]
    
        ApiService.callPost(url: Configuration.environment + "restaurant/nearest", params: params) { (message, data) in
            
            let result = Result<[Restaurant]>()
            do {
                if let jsonData = data {
                    if let restaurant = try JSONDecoder().decode([Restaurant].self, from: jsonData) as [Restaurant]? {
                        result.success = restaurant;
                        completion(result)
                    }
                }
            } catch {
                result.error = error
                completion(result)
            }
        }
        
    }
    
    
 
}
