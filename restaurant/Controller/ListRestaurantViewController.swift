//
//  ListRestaurantViewController.swift
//  restaurant
//
//  Created by Mohson Butt [DAN-PARIS] on 30/12/2017.
//  Copyright © 2017 ESGI. All rights reserved.
//

import UIKit
import WatchConnectivity

class ListRestaurantViewController: UIViewController {
    
    var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    @IBOutlet weak var tableViewRestaurant: UITableView!
    
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
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
        let repo = ApiRestaurantRepository()
        repo.getNearest(lat: "48.8752937317", long: "2.2851102352") { (result) in
            
            guard let data = result.success else {
                if let error = result.error {
                    print(error)
                }
                return
            }
            
            self.restaurant = data
        
        }
        
        // Do any additional setup after loading the view.
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
