//
//  RateController.swift
//  restaurant WatchKit Extension
//
//  Created by Grunt on 25/01/2018.
//  Copyright © 2018 ESGI. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class RateController: WKInterfaceController {
    
    var sliderValue = 1 as Int
    
    @IBAction func lessClicked() {
        sliderValue = sliderValue - 1
        if (sliderValue <= 1) {
            lessButton.setEnabled(false)
        }
        moreButton.setEnabled(true)
        updateRate(rate: sliderValue)
    }
    
    @IBAction func moreClicked() {
        sliderValue = sliderValue + 1
        if (sliderValue >= 5) {
            moreButton.setEnabled(false)
        }
        lessButton.setEnabled(true)
        updateRate(rate: sliderValue)
    }
    
    func updateRate (rate: Int) {
        print(NSString(format: "%d", sliderValue) as String)
        rateLabel.setText(NSString(format: "%d", sliderValue) as String)
    }
    
    @IBOutlet var lessButton: WKInterfaceButton!
    @IBOutlet var moreButton: WKInterfaceButton!
    @IBOutlet var rateLabel: WKInterfaceLabel!
    
    @IBAction func rateClicked() {
        print(NSString(format: "%d", sliderValue) as String)
        pop()
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        lessButton.setEnabled(false)
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
}
