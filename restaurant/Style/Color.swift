//
//  Color.swift
//  restaurant
//
//  Created by Mohson Butt [DAN-PARIS] on 30/12/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import Foundation
import UIKit

extension Color {
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        switch self {
        case .theme:
            instanceColor = UIColor(hexString: "#FAFDFD")
        case .border:
            instanceColor = UIColor(hexString: "#239FFC")
        case .shadow:
            instanceColor = UIColor(hexString: "#D3D9DB")
        case .darkBackground:
            instanceColor = UIColor(hexString: "#999966")
        case .lightBackground:
            instanceColor = UIColor(hexString: "#D3D9DB")
        case .intermidiateBackground:
            instanceColor = UIColor(hexString: "#164FF4")
        case .darkText:
            instanceColor = UIColor(hexString: "#7978A5")
        case .intermidiateText:
            instanceColor = UIColor(hexString: "#FAFDFD")
        case .lightText:
            instanceColor = UIColor(hexString: "#FAFDFD")
        case .affirmation:
            instanceColor = UIColor(hexString: "#FAFDFD")
        case .negation:
            instanceColor = UIColor(hexString: "#FF5150")
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
        }
        return instanceColor
    }
}


enum Color {
    
    case theme // Colours on Navigation Bar, Button Titles, Progress Indicator etc.
    case border // Hair line separators in between views.
    case shadow // Shadow colours for card like design.
    
    case darkBackground // Dark background colour to group UI components with light colour.
    case lightBackground // Light background colour to group UI components with dark colour.
    case intermidiateBackground // Used for grouping UI elements with some other colour scheme.
    
    case darkText
    case lightText
    case intermidiateText
    
    case affirmation // Colour to show success, something right for user.
    case negation // Colour to show error, some danger zones for user.
    // 1
    case custom(hexString: String, alpha: Double)
    // 2
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}
