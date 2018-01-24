import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    @IBOutlet weak var mapView: MKMapView!
    
    private let mapPresenter = MapViewPresenter(repo: ApiRestaurantRepository())
    
    var requestRun: Bool = false
    var requestCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.mapType = MKMapType.standard
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        let viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 400, 400)
        mapView.setRegion(viewRegion, animated: false)
        
        if requestRun == false && requestCount < 1 {
            requestRun = true
            mapPresenter.getNearestRest(lat: String(userLocation.coordinate.latitude), long: String(userLocation.coordinate.longitude), onEnd: { () -> (Void) in
                print("ok")
                self.requestRun = false
                self.requestCount += 1
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}


extension MapViewController: MKMapViewDelegate {
    
}
