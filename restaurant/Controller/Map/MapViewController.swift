import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    private let mapPresenter = MapViewPresenter(repo: ApiRestaurantRepository())
    
    var requestRun: Bool = false
    var requestCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapPresenter.attachView(view: self)
        
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
        
        let viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800)
        mapView.setRegion(viewRegion, animated: false)
        
        if requestRun == false && requestCount < 1 {
            requestRun = true
            mapPresenter.getNearestRest(lat: String(userLocation.coordinate.latitude), long: String(userLocation.coordinate.longitude), onEnd: { () -> (Void) in
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


extension MapViewController: RootView {
    func startLoading() {
        loader.isHidden = false
    }
    
    func finishLoading() {
        loader.isHidden = true
    }
    
    func addListRestaurant(res: [Restaurant]) {
        for r in res {
            let pointAnnoation = MKPointAnnotation()
            pointAnnoation.title = r.title
            pointAnnoation.subtitle = r.address
            pointAnnoation.coordinate = CLLocationCoordinate2DMake(Double(r.latitude), Double(r.longitude))
            mapView?.addAnnotation(pointAnnoation)
        }
    }
    
    func setEmptyRestaurant() {
        
    }
    
    
}
