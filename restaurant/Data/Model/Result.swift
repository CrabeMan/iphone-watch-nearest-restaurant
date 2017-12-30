//
//  Result.swift
//  restaurant
//
//  Created by Mohson Butt [DAN-PARIS] on 30/12/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import Foundation


open class Result<T> {
    public var success : T?
    public var error : Error?
}
