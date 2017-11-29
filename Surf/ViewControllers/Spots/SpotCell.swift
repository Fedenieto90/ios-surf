//
//  SpotCell.swift
//  Surf
//
//  Created by Fede on 11/18/17.
//  Copyright © 2017 fede. All rights reserved.
//

import UIKit

class SpotCell: UITableViewCell {

    static let cellID = "SpotCell"
    
    @IBOutlet weak var spotNameLbl: UILabel!
    @IBOutlet weak var primarySwellLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var secondarySwellLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var ratingView: UIView!
    
    var spot : Spot! {
        didSet {
            setSpotInformation()
        }
    }
    
    func setSpotInformation() {
        self.spotNameLbl.text = spot.name
        
        //Get actual forecast
        let actualForecast = SpotManager.shared.actualForecast(forecasts: spot.forecast)
        
        //Display primary swell information
        if let primarySwell = actualForecast.swell.getSwellComponent(swellComponentType: .primary) {
            self.primarySwellLbl.text = "Primary Swell: \(primarySwell.period!)s \(primarySwell.compassDirection!)  \(primarySwell.height!)\(actualForecast.swell.unit!)"
        }
        
        //Display secondary swell information
        if let secondarySwell = actualForecast.swell.getSwellComponent(swellComponentType: .secondary) {
            self.secondarySwellLbl.text = "Secondary Swell: \(secondarySwell.period!)s \(secondarySwell.compassDirection!) \(secondarySwell.height!)\(actualForecast.swell.unit!)"
        }
        
        //Display Wind information
        if spot.favorableWinds.count > 0 {
            let windFavorable = spot.favorableWinds.contains(actualForecast.wind.compassDirection)
            
            self.windLbl.text = "Wind: \(actualForecast.wind.speed) \(actualForecast.wind.unit) \(actualForecast.wind.compassDirection) \((windFavorable) ? "(Good)" : "(Not good)")"
        } else {
            self.windLbl.text = "Wind: \(actualForecast.wind.speed) \(actualForecast.wind.unit) \(actualForecast.wind.compassDirection)"
        }
       
        
        //Display rating information
        self.ratingLbl.text = "Rating: \(actualForecast.solidRating)"
        self.ratingView.backgroundColor = SpotManager.shared.ratingColor(rating: actualForecast.solidRating)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
