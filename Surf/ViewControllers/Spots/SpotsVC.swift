//
//  SpotsVC.swift
//  Surf
//
//  Created by Fede on 11/17/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit
import MBProgressHUD

class SpotsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLbl: UILabel!
    
    var spots = [Spot]()
    var incomingSpots = [Spot]()
    var refreshControl = UIRefreshControl()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get actual forecast for every spot
        self.getActualSpotsForecast()
        
        //Add refresh control
        refreshControl.addTarget(self, action: #selector(getActualSpotsForecast), for: UIControlEvents.valueChanged)
        self.tableView.refreshControl = refreshControl
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Set Large Title
        setLargeTitle()
    }
    
    func setLargeTitle() {
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSpotDetail" {
            let vc = segue.destination as! SpotDetailVC
            vc.spot = self.spots[self.tableView.indexPathForSelectedRow!.row]
        }
    }
    
    @objc func getActualSpotsForecast() {
        
        // Get forecast information for each spot
        let group = DispatchGroup()
        if !refreshControl.isRefreshing {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        incomingSpots = []
        for spot in SpotManager.shared.spots {
            group.enter()
            MagicSeaWeedAPI.shared.getSpotForecast(spot: spot, completion: { (spotForecasts, error) in
                if error == nil {
                    //Append forecast information for each spot
                    spot.forecast = spotForecasts!
                    self.incomingSpots.append(spot)
                }
                group.leave()
            })
        }
        
        //Finished getting forecast information from all the spots
        group.notify(queue: .main) {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.refreshControl.endRefreshing()
            self.spots = self.incomingSpots
            self.sortForecastByRating()
            self.tableView.reloadData()
        }
    }
    
    func sortForecastByRating() {
        self.spots = self.spots.sorted(by: { (SpotManager.shared.actualForecast(forecasts: ($0.forecast)).solidRating) > (SpotManager.shared.actualForecast(forecasts: ($1.forecast)).solidRating) })
    }
    
}

extension SpotsVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.spots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SpotCell.cellID, for: indexPath) as! SpotCell
        let spot = self.spots[indexPath.row]
        cell.spot = spot
        return cell
    }
    
}
