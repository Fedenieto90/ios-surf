//
//  Wind.swift
//  Surf
//
//  Created by Fede on 11/17/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit

class Wind: NSObject {

    var speed : Double
    var direction : Double
    var compassDirection : String
    var chill : Double
    var gusts : Double
    var unit : String
    
    init(data: [String : Any]) {
        self.speed = data["speed"] as! Double
        self.direction = data["direction"] as! Double
        self.compassDirection = data["compassDirection"] as! String
        self.chill = data["chill"] as! Double
        self.gusts = data["gusts"] as! Double
        self.unit = data["unit"] as! String
    }
}
