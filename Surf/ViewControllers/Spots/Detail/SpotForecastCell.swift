//
//  SpotForecastCell.swift
//  Surf
//
//  Created by Fede on 11/19/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit

class SpotForecastCell: UITableViewCell {
    
    static let cellID = "SpotForecastCell"
    
    @IBOutlet weak var primarySwellLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var secondarySwellLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var ratingView: UIView!
    
    var spot : Spot!
    var forecast : Forecast!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
         setForecastInformation()
    }

    func setForecastInformation() {
        
        //Display primary swell information
        if let primarySwell = forecast.swell.getSwellComponent(swellComponentType: .primary) {
            self.primarySwellLbl.text = "Primary Swell: \(primarySwell.period!)s \(primarySwell.compassDirection!)  \(primarySwell.height!)\(forecast.swell.unit!)"
        }
        
        //Display secondary swell information
        if let secondarySwell = forecast.swell.getSwellComponent(swellComponentType: .secondary) {
            self.secondarySwellLbl.text = "Secondary Swell: \(secondarySwell.period!)s \(secondarySwell.compassDirection!) \(secondarySwell.height!)\(forecast.swell.unit!)"
        }
        
        //Display Wind information
        if spot.favorableWinds.count > 0 {
            let windFavorable = spot.favorableWinds.contains(forecast.wind.compassDirection)
            self.windLbl.text = "Wind: \(forecast.wind.speed) \(forecast.wind.unit) \(forecast.wind.compassDirection) \((windFavorable) ? "(Good)" : "(Not good)")"
        } else {
            self.windLbl.text = "Wind: \(forecast.wind.speed) \(forecast.wind.unit) \(forecast.wind.compassDirection)"
        }
            
        //Display rating information
        self.ratingLbl.text = "Rating: \(forecast.solidRating)"
        self.ratingView.backgroundColor = SpotManager.shared.ratingColor(rating: forecast.solidRating)
        
    }

}
