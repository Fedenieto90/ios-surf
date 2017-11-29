//
//  Swell.swift
//  Surf
//
//  Created by Fede on 11/17/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit

enum SwellComponentType : String {
    case combined = "combined"
    case primary = "primary"
    case secondary = "secondary"
    case tertiary = "tertiary"
}

class Swell: NSObject {
    
    var absoluteMinBreakingHeight : Double!
    var absoluteMaxBreakingHeight : Double!
    var unit : String!
    var minimumBreakingHeight : Double!
    var maximumBreakingHeight : Double!
    var components = [SwellComponent]()
    
    init(data : [String : Any]) {
        self.absoluteMinBreakingHeight = data["absMinBreakingHeight"] as! Double
        self.absoluteMaxBreakingHeight = data["absMaxBreakingHeight"] as! Double
        self.unit = data["unit"] as! String
        self.minimumBreakingHeight = data["minBreakingHeight"] as! Double
        self.maximumBreakingHeight = data["maxBreakingHeight"] as! Double
        let components = data["components"] as! [String : [String : Any]]
        for item in components {
            let swellComponent = SwellComponent(key: item.key, data: item.value)
            self.components.append(swellComponent)
        }
    }
    
    func getSwellComponent(swellComponentType : SwellComponentType) -> SwellComponent? {
        return self.components.filter {$0.type == swellComponentType.rawValue}.first
    }

}
