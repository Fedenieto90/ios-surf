//
//  Forecast.swift
//  Surf
//
//  Created by Fede on 11/17/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit

class Forecast: NSObject {

    var date : Date
    var fadedRating : Int
    var solidRating : Int
    var swell : Swell
    var wind : Wind
    var condition : Condition
    var chart : Chart
    
    init(data : [String : Any]) {
        self.date = Date(timeIntervalSince1970: data["timestamp"] as! Double)
        self.fadedRating = data["fadedRating"] as! Int
        self.solidRating = data["solidRating"] as! Int
        self.swell = Swell(data: data["swell"] as! [String : Any])
        self.wind = Wind(data: data["wind"] as! [String : Any])
        self.condition = Condition(data: data["condition"] as! [String : Any])
        self.chart = Chart(data: data["charts"] as! [String : Any])
    }
    
}
