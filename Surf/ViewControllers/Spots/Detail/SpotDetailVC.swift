//
//  SpotDetailVC.swift
//  Surf
//
//  Created by Fede on 11/19/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit
import MapKit

class SpotDetailVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    var spot : Spot!
    var futureForecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = spot.name
        
        //Init map
        initMap()
        
        //Get future forecasts only
        futureForecasts = SpotManager.shared.futureForecast(forecasts: self.spot.forecast)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Set Small Title
        setSmallTitle()
    }
    
    func setSmallTitle() {
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = false
        }
    }
    
    func initMap() {
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: spot.location.latitude, longitude: spot.location.longitude)
        annotation.coordinate = centerCoordinate
        annotation.title = spot.name
        mapView.addAnnotation(annotation)
        mapView.showAnnotations([annotation], animated: true)
        self.mapView.isZoomEnabled = false
        self.mapView.isScrollEnabled = false
        self.mapView.isUserInteractionEnabled = false
    }

}

extension SpotDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return futureForecasts.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = futureForecasts[section].date
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = SurfString.Spots.actualDateStringFormat
        return dateformatter.string(from: date)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SpotForecastCell.cellID, for: indexPath) as! SpotForecastCell
        let forecast = futureForecasts[indexPath.section]
        cell.forecast = forecast
        cell.spot = self.spot
        return cell
    }
    
}
