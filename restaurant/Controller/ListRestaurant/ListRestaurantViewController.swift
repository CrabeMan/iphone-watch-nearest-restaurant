import UIKit
import WatchConnectivity

class ListRestaurantViewController: UIViewController {

    @IBOutlet weak var tableViewRestaurant: UITableView!
    @IBOutlet weak var animateLoading: UIActivityIndicatorView!
    
    private let listPresenter = ListRestaurantPresenter(repo: ApiRestaurantRepository())
    
    var restaurant : [Restaurant] = [] {
        didSet {
            self.reloadRows()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Liste Restaurant"
        self.tableViewRestaurant.delegate = self;
        self.tableViewRestaurant.dataSource = self;
        
        self.listPresenter.attachView(view: self)
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        //todo get location
        self.listPresenter.getNearestRest(lat: "48.8752937317", long: "2.2851102352")
    
    }

    func reloadRows()  {
        DispatchQueue.main.async{
            self.tableViewRestaurant.reloadData()
        }
    }
}


extension ListRestaurantViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        
        print(self.restaurant[row].title)
        
        let session = WCSession.default
        guard session.isPaired && session.isWatchAppInstalled else {
            return
        }
        
        guard let encodedRestaurant = try? JSONEncoder().encode(self.restaurant[row]) else {
            return
        }
        
        print(encodedRestaurant)
        
        session.transferUserInfo([
            "restaurant": encodedRestaurant,
        ])
    }
    
}


extension ListRestaurantViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurant.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "AccessoryTableViewCell") ?? UITableViewCell(style: .default, reuseIdentifier: "AccessoryTableViewCell")
        cell.textLabel?.text = self.restaurant[indexPath.row].title
        
        return cell
    }
    
}
extension ListRestaurantViewController : ListRestaurantView{
    func startLoading() {
        self.animateLoading.startAnimating()
    }
    
    func finishLoading() {
        self.animateLoading.stopAnimating()
    }
    
    func setListRestaurant(res : [Restaurant]){
        self.restaurant = res
        DispatchQueue.main.async{
            self.tableViewRestaurant.isHidden = false;
            self.finishLoading()
        }
    }
    
    func setEmptyRestaurant() {
        DispatchQueue.main.async{
            self.tableViewRestaurant.isHidden = false;
        }
        
    }
}


extension ListRestaurantViewController : WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
    }
}
