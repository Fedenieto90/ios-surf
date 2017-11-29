//
//  SwellComponent.swift
//  Surf
//
//  Created by Fede on 11/17/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit

class SwellComponent: NSObject {
    
    var type : String!
    var height : Double!
    var period : Double!
    var direction : Double!
    var compassDirection : String!
    
    init(key: String, data : [String : Any]) {
        self.type = key
        self.height = data["height"] as! Double
        self.period = data["period"] as! Double
        self.direction = data["direction"] as! Double
        self.compassDirection = data["compassDirection"] as! String
    }
    
}
