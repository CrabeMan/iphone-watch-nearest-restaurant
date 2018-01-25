import WatchKit
import Foundation
import WatchConnectivity
import MapKit

class DetailController: WKInterfaceController {
    
    var restaurant: Restaurant?
    @IBOutlet var titleText: WKInterfaceLabel!
    @IBOutlet var cuisineText: WKInterfaceLabel!
    @IBOutlet var addressText: WKInterfaceLabel!
    @IBOutlet var distanceText: WKInterfaceLabel!
    @IBOutlet var image: WKInterfaceImage!
    @IBOutlet var map: WKInterfaceMap!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        print(context!)
        if let rest = context as? Restaurant {
            print(rest)
            restaurant = rest
            titleText.setText(rest.title)
            let cuisine = rest.cuisine.replacingOccurrences(of: ", ", with: "\n")
            cuisineText.setText("Type : \(cuisine)")
            addressText.setText(rest.address)
            distanceText.setText(NSString(format: "%.2fkm", rest.distance) as String)
            
            let url = URL(string: rest.photo)
            if let data = try? Data(contentsOf: url!) { //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                image.setImage(UIImage(data: data))
            }
        }
    }
    
    @IBAction func rateButton() {
        presentController(withName: "RateController", context: self.restaurant)
    }
    
    @IBAction func goButton() {
        
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}
