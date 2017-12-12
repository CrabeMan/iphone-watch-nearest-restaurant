import UIKit
import WatchConnectivity


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        let params:[String : Any] = [
            "lat": "48.8752937317",
            "lon": "2.2851102352"]
        
        
        
        
        ApiService.callPost(url: "http://mustache.labite.win:5000/restaurant/nearest", params: params) { (message, data) in
            print(message)
            do {
                if let jsonData = data {
                    if let restaurant = try JSONDecoder().decode([Restaurant].self, from: jsonData) as [Restaurant]? {
                        print(restaurant)
                    }
                }
            } catch {
                print("Parse Error: \(error)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController : WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
    }
}
