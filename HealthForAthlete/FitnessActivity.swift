//
//  FitnessActivity.swift
//  HealthForAthlete
//
//  Created by Nick Sentjens on 2017-04-07.
//  Copyright © 2017 NickSentjens. All rights reserved.
//

import Foundation
import UIKit

class FitnessActivity {
    
    //MARK: Properties
    
    var activityName: String
    var activityPhoto: UIImage?
    var howOften: String // example: Weekly or One Time
    var dayValue: String // example: Every Wednesday or April 2, 2017
    var howManyHours: Float
    
    var stepsPerHour: Int
    var caloriesPerHour: Int
    
    //MARK: Initialization
    
    init?(activityName: String, activityPhoto: UIImage?, howOften: String, dayValue: String, howManyHours: Float) {
        self.activityName = activityName
        self.activityPhoto = activityPhoto
        self.howOften = howOften
        self.dayValue = dayValue
        self.howManyHours = howManyHours
        
        if activityName == "Baseball" {
            self.stepsPerHour = 100
            self.caloriesPerHour = 200
        }
        else {
            return nil
        }
    }
}

