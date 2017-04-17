//
//  CreateScheduleViewController.swift
//  HealthForAthlete
//
//  Created by Nick Sentjens on 2017-04-10.
//  Copyright © 2017 NickSentjens. All rights reserved.
//

import UIKit

class CreateScheduleViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let nandoRed: UIColor = UIColor(colorLiteralRed: 188/255, green: 23/255, blue: 23/255, alpha: 1.0)
    
    let activityPickerData = ["Baseball", "Hockey", "Running"]
    
    
    let howOftenPickerData = ["Every Day", "Weekly", "Monthly"]
    
    @IBOutlet weak var createScheduleNavigationBar: UINavigationBar!
    
    @IBOutlet weak var activityPicker: UIPickerView!
    /*@IBOutlet weak var activityPicker: UIPickerView!
    
    @IBOutlet weak var stepsPerHourTextView: UITextView!
    
    @IBOutlet weak var caloriesPerHourTextView: UITextView!
    
    
    @IBOutlet weak var howOftenPicker: UIPickerView!
    
    @IBOutlet weak var whatDayTextField: UITextField!
    
    
    @IBOutlet weak var howLongTextField: UITextField!*/
    
    @IBOutlet weak var howOftenPicker: UIPickerView!
    var activityName: String = ""
    var activityPhoto: UIImage?
    var howOften: String = "" // example: Weekly or One Time
    var dayValue: String = "" // example: Every Wednesday or April 2, 2017
    var howManyHours: Float = 0
    
    
    var stepsPerHour: Int = 0
    var caloriesPerHour: Int = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == activityPicker {
            return activityPickerData.count
        }
            
        else if pickerView == howOftenPicker {
            return howOftenPickerData.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == activityPicker {
            activityName = activityPickerData[row]
        }
            
        else if pickerView == howOftenPicker {
            activityName = howOftenPickerData[row]
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*activityPicker.delegate = self
        activityPicker.dataSource = self
        
        howOftenPicker.delegate = self
        howOftenPicker.dataSource = self
        
        
        createScheduleNavigationBar.titleTextAttributes = [NSForegroundColorAttributeName: nandoRed]

        // Do any additional setup after loading the view.*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
