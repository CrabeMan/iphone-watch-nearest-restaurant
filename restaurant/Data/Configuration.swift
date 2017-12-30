//
//  Configuration.swift
//  restaurant
//
//  Created by Mohson Butt [DAN-PARIS] on 30/12/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import Foundation

struct Configuration {
    
    #if DEBUG
    
    enum Environment: String {
        case Dev = "http://localhost:5000/"
    }
    
    static let environment = Environment.Dev.rawValue//we can change this at any time
    
    #else
    static let environment = NSBundle.mainBundle().infoDictionary!  ["API_BASE_URL_ENDPOINT"] as! String
    #endif
}
