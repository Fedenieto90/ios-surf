//
//  Condition.swift
//  Surf
//
//  Created by Fede on 11/17/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit

class Condition: NSObject {

    var pressure : Double
    var temperature : Double
    var weather : Double
    var unitPressure : String
    var unit : String
    
    init(data : [String : Any]) {
        self.pressure = data["pressure"] as! Double
        self.temperature = data["temperature"] as! Double
        self.weather = data["weather"] as! Double
        self.unitPressure = data["unitPressure"] as! String
        self.unit = data["unit"] as! String
     }
}
