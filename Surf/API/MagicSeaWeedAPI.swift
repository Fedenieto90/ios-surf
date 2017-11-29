//
//  MagicSeaWeedAPI.swift
//  Surf
//
//  Created by Fede on 11/17/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit
import Networking

struct APIKeys {
    static let key = "908ba89e245569ba2eb2bc9e432ebf45"
    static let secret = "1e88ef4dac1ffd4f5a4aa26556f0345d"
}

struct Environment {
    static let baseURL = "http://magicseaweed.com/api"
}

struct Path {
    static let forecast = "forecast"
}

class MagicSeaWeedAPI: NSObject {
    
    static let shared = MagicSeaWeedAPI()
    
    func getSpotForecast(spot : Spot,
                         completion : @escaping (_ forecast : [Forecast]?,_ error : Error?) -> Void) {
        let networking = Networking(baseURL: "\(Environment.baseURL)/\(APIKeys.key)/\(Path.forecast)/?spot_id=\(spot.id!)")
        networking.get("/get") { result in
            switch result {
            case .success(let response):
                let spotData = response.arrayBody
                var forecastArray = [Forecast]()
                for forecastData in spotData {
                    let forecast = Forecast(data: forecastData)
                    forecastArray.append(forecast)
                }
                completion(forecastArray, nil)
            break
            case .failure(let response):
                completion(nil, response.error)
            break
            }
        }
    }

}
