//
//  SpotManager.swift
//  Surf
//
//  Created by Fede on 11/18/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit

class SpotManager: NSObject {
    
    static let shared = SpotManager()
    
    var spots = [Spot(spotID : "2704",
                      spotName : "Biología",
                      favorableWinds : ["W", "WNW", "NW", "NNW", "NWN"],
                      location : Location(latitude : -38.026880, longitude : -57.529630)),
                 Spot(spotID : "2705",
                      spotName : "Yatch",
                      favorableWinds : ["S", "SW", "SSW", "W", "WSW"],
                      location : Location(latitude : -38.031482, longitude : -57.531461)),
                 Spot(spotID : "2708",
                      spotName : "Waikiki",
                      favorableWinds : [],
                      location: Location(latitude : -38.080202, longitude : -57.5391434)),
                 Spot(spotID : "4720",
                      spotName : "Varese",
                      favorableWinds : [],
                      location: Location(latitude : -38.014559, longitude : -57.528728)),
                 Spot(spotID : "4163",
                      spotName : "La Paloma",
                      favorableWinds : [],
                      location: Location(latitude : 1, longitude : 1) ),
                 Spot(spotID : "1280",
                      spotName : "Quequén",
                      favorableWinds : [],
                      location: Location(latitude : 1, longitude : 1)),
                 Spot(spotID : "1287",
                      spotName : "Serena",
                      favorableWinds : [],
                      location: Location(latitude : -38.108527, longitude : -57.575623)),
                 Spot(spotID : "501",
                      spotName : "Miramar",
                      favorableWinds : [],
                      location: Location(latitude : 1, longitude : 1))]
    
    func actualForecast(forecasts : [Forecast]) -> Forecast {
        let actualDate = Date()
        //Sort forecasts by timestamp
        let sortedForecastByTimestamp = forecasts.sorted(by: { $0.date < $1.date })
        //Get forecasts that are behind current timestamp
        let actualForecasts = sortedForecastByTimestamp.filter {$0.date < actualDate}
        //Return the last one that corresponds to the most near forecast to actual date
        return actualForecasts.last!
    }
    
    func futureForecast(forecasts : [Forecast]) -> [Forecast] {
        let actualDate = Date()
        
        //Sort forecasts by date
        let sortedForecastByTimestamp = forecasts.sorted(by: { $0.date < $1.date })
        
        //Get future forecasts
        let futureForecasts = sortedForecastByTimestamp.filter {$0.date >= actualDate}

        return futureForecasts
    }
    
    func ratingColor(rating : Int) -> UIColor {
        if rating == 0 {
            return UIColor.red
        } else if rating >= 1 && rating <= 2 {
            return UIColor.orange
        } else {
            return UIColor.green
        }
    }
}
