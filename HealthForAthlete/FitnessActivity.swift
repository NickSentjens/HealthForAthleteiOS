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
    var howOften: String // example: Weekly or One Time, This is the picker
    var dayValue: String // example: Every Wednesday or April 2, 2017
    var howManyHours: Float
    
    
    var stepsPerHour: Int
    var caloriesPerHour: Int
    
    //MARK: Initialization
    
    
    init() {
        activityName = ""
        activityPhoto = nil
        howOften = ""
        dayValue = ""
        howManyHours = 0
        stepsPerHour = 0
        caloriesPerHour = 0
    }
    
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
    
    func setActivityName(name: String) {
        self.activityName = name
        
        if activityName == "Hockey" {
            self.stepsPerHour = 120
            self.caloriesPerHour = 210
        }
        
        else if activityName == "Baseball" {
            self.stepsPerHour = 100
            self.caloriesPerHour = 200
            let baseballImage: UIImage = UIImage(named: "baseball.png")!
            self.activityPhoto = baseballImage
        }

    }
    
    func isActivityComplete() -> Bool {
        if self.activityName != "" && self.activityPhoto != nil && self.howOften != "" && self.dayValue != "" && self.howManyHours != 0 && self.stepsPerHour != 0 && self.caloriesPerHour != 0 {
            return true
        }
        return false
    }
    
    
}

