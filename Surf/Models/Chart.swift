//
//  Chart.swift
//  Surf
//
//  Created by Fede on 11/17/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit

class Chart: NSObject {
    
    var swell : String
    var period : String
    var wind : String
    var pressure : String
    var sst : String
    
    init(data: [String : Any]) {
        self.swell = data["swell"] as! String
        self.period = data["period"] as! String
        self.wind = data["wind"] as! String
        self.pressure = data["pressure"] as! String
        self.sst = data["sst"] as? String ?? ""
    }
  
}
