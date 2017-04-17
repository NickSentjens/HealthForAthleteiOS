//
//  TestCreateViewController.swift
//  HealthForAthlete
//
//  Created by Nick Sentjens on 2017-04-12.
//  Copyright © 2017 NickSentjens. All rights reserved.
//

import UIKit

class TestCreateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    let nandoRed: UIColor = UIColor(colorLiteralRed: 188/255, green: 23/255, blue: 23/255, alpha: 1.0)

    let activityPickerData = ["Baseball", "Hockey", "Running"]
    
    let howOftenPickerData = ["Every Day", "Weekly", "Monthly"]
    
    @IBOutlet weak var createNewScheduleNavBar: UINavigationBar!
    
    @IBOutlet weak var activityPickerView: UIPickerView!
    @IBOutlet weak var howOftenPickerView: UIPickerView!
    
    @IBOutlet weak var stepsPerHourTextField: UITextField!
    @IBOutlet weak var caloriesPerHourTextField: UITextField!
    @IBOutlet weak var whatDaysTextField: UITextField!
    @IBOutlet weak var howLongTextField: UITextField!
    
    var activity = FitnessActivity.init()
    
    //var activityName: String?
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == activityPickerView {
            return activityPickerData.count
        }
        else {
            return howOftenPickerData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == activityPickerView {
            activity.setActivityName(name: activityPickerData[row])
            stepsPerHourTextField.text = String(activity.stepsPerHour)
            caloriesPerHourTextField.text = String(activity.caloriesPerHour)
        }
            
        else if pickerView == howOftenPickerView {
            activity.howOften = howOftenPickerData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == activityPickerView {
            return activityPickerData[row]
        }
            
        else {
            return howOftenPickerData[row]
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityPickerView.delegate = self
        activityPickerView.dataSource = self
        
        howOftenPickerView.delegate = self
        howOftenPickerView.dataSource = self
        
        stepsPerHourTextField.delegate = self
        caloriesPerHourTextField.delegate = self
        whatDaysTextField.delegate = self
        howLongTextField.delegate = self
        

        createNewScheduleNavBar.titleTextAttributes = [NSForegroundColorAttributeName: nandoRed]
        // Do any additional setup after loading the view.
        
        hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UI Text Field Delegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == whatDaysTextField {
            animateViewMoving(up: true, moveValue: 200)
            if whatDaysTextField.text == "Example: Every Friday"
            {
                textField.text = ""
                textField.textColor = UIColor.black
            }
        }
        
        else if textField == howLongTextField {
            animateViewMoving(up: true, moveValue: 200)
        }
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        //let movement:CGFloat = ( up ? -moveValue : moveValue)
        
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: -moveValue)
        UIView.commitAnimations()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == whatDaysTextField {
            animateViewMoving(up: true, moveValue: -200)
            if !((textField.text?.contains("Every"))!) {
                textField.textColor = UIColor.lightGray
                textField.text = "Example: Every Friday"
            }
            else {
                activity.dayValue = textField.text!
            }
            
        }
        else if textField == howLongTextField {
            animateViewMoving(up: true, moveValue: -200)
            if Int(textField.text!) != 0 {
                activity.howManyHours = Float(textField.text!)!
            }
        }
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
