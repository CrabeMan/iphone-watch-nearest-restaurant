import UIKit
import WatchConnectivity

class ListRestaurantViewController: UIViewController{

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
        
        tableViewRestaurant.addInfiniteScroll { (tableView) -> Void in
            self.listPresenter.getNextRestaurantPage(onEnd: { () -> (Void) in
                DispatchQueue.main.async{
                    tableView.finishInfiniteScroll()
                }
            })
        }
    
        tableViewRestaurant.setShouldShowInfiniteScrollHandler { _ -> Bool in
            return true
        }
        
        self.navigationItem.title = "Liste Restaurant"
        self.tableViewRestaurant.delegate = self;
        self.tableViewRestaurant.dataSource = self;
        
        self.listPresenter.attachView(view: self)
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
        self.listPresenter.getNextRestaurantPage { () -> (Void) in
        }
    }

    func reloadRows()  {
        DispatchQueue.main.async{
            self.tableViewRestaurant.reloadData()
        }
    }
}


extension ListRestaurantViewController : UITableViewDelegate{
    
    
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
extension ListRestaurantViewController : RootView {
    func startLoading() {
        self.animateLoading.startAnimating()
    }
    
    func finishLoading() {
        DispatchQueue.main.async{
                self.animateLoading.stopAnimating()
        }
    }
    
    func addListRestaurant(res : [Restaurant]) {
        for r in res {
            self.restaurant.append(r)
        }
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
