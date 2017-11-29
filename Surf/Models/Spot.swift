//
//  Spot.swift
//  Surf
//
//  Created by Fede on 11/17/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit

struct Location {
    var latitude : Double
    var longitude : Double
}

class Spot: NSObject {
    
    var id : String!
    var name : String
    var forecast = [Forecast]()
    var favorableWinds = [String]()
    var location : Location
    
    init(spotID : String, spotName : String, favorableWinds : [String], location : Location) {
        self.id = spotID
        self.name = spotName
        self.favorableWinds = favorableWinds
        self.location = location
    }
    
}
