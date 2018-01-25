import WatchKit
import Foundation
import WatchConnectivity
import MapKit

class InterfaceController: WKInterfaceController {
    
    @IBOutlet var map: WKInterfaceMap!
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        locationManager.requestWhenInUseAuthorization()
        
        let mapLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37, -122);
        let coordinateSpan:MKCoordinateSpan = MKCoordinateSpanMake(1, 1);
        
        //self.map.addAnnotation(mapLocation, with: .purple)
        //self.map.setRegion(MKCoordinateRegionMake(mapLocation, coordinateSpan))
    }
    
    override func willActivate() {
        super.willActivate()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }

}

extension InterfaceController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        //print(userInfo)
        
        guard let restaurant = try? JSONDecoder().decode(Restaurant.self, from: userInfo["restaurant"] as! Data) else {
            return
        }
        print(restaurant)
        
        presentController(withName: "DetailController", context: restaurant)
    }
    
}
