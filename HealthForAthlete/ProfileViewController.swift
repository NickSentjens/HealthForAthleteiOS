//
//  ProfileViewController.swift
//  HealthForAthlete
//
//  Created by Nick Sentjens on 2017-03-30.
//  Copyright © 2017 NickSentjens. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension String {
    var doubleValue: Double? {
        return Double(self)
    }
    var integerValue: Int? {
        return Int(self)
    }
}

class ProfileViewController: UIViewController, UITextFieldDelegate {
    let nandoRed: UIColor = UIColor(colorLiteralRed: 188/255, green: 23/255, blue: 23/255, alpha: 1.0)
    
    
    @IBOutlet weak var profileNavigationBar: UINavigationBar!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var nameTextView: UITextView!
    @IBOutlet weak var weightTextView: UITextView!
    @IBOutlet weak var ageTextView: UITextView!
    
    @IBOutlet weak var weightSegmentControl: UISegmentedControl!

    
    @IBOutlet weak var stepsSlider: UISlider!
    @IBOutlet weak var stepsTextField: UITextField!
    
    @IBOutlet weak var caloriesSlider: UISlider!
    
    @IBOutlet weak var caloriesTextField: UITextField!



    
    @IBAction func weightSegmentAction(_ sender: Any) {
        if weightSegmentControl.selectedSegmentIndex == 0 {
            weightUnit = "Lbs"
        }
        else if weightSegmentControl.selectedSegmentIndex == 1 {
            weightUnit = "Kgs"
        }
    }
    
    
    @IBAction func stepsSliderEditingEnded(_ sender: Any) {
        if stepsGoals != nil {
            stepsGoals = Int(floor(stepsSlider.value))
        }
    }
    
    @IBAction func stepsSliderBeingEdited(_ sender: Any) {
        let currentStepsOnSlider = Int(floor(stepsSlider.value))
        stepsTextField.text = String(currentStepsOnSlider)
    }
    
    @IBAction func caloriesSliderEditingEnded(_ sender: Any) {
        caloriesGoals = Int(floor(caloriesSlider.value))
    }
    
    @IBAction func caloriesSliderBeingEdited(_ sender: Any) {
        let currentCaloriesOnSlider = Int(floor(caloriesSlider.value))
        caloriesTextField.text = String(currentCaloriesOnSlider)
    }
    
    var name: String?
    var age: Int?
    var weight: Int?
    var weightUnit: String = "Lbs"
    var stepsGoals: Int?
    var caloriesGoals: Int?
    
    var keyboardHeight: CGFloat?
    
    
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? CGRect {
            keyboardHeight = keyboardSize.height
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.autocorrectionType = .no
        ageTextField.autocorrectionType = .no
        weightTextField.autocorrectionType = .no
        stepsTextField.autocorrectionType = .no
        caloriesTextField.autocorrectionType = .no
        
        nameTextField.delegate = self
        nameTextField.setBottomBorder()
        
        ageTextField.delegate = self
        ageTextField.setBottomBorder()
        
        weightTextField.delegate = self
        weightTextField.setBottomBorder()
        
        stepsTextField.delegate = self
        stepsTextField.setBottomBorder()
        
        caloriesTextField.delegate = self
        caloriesTextField.setBottomBorder()
        
        stepsSlider.maximumValue = 25000
        stepsSlider.minimumValue = 5000
        stepsSlider.setValue(10000.0, animated: true)
        stepsTextField.text = "Steps"
        
        caloriesSlider.maximumValue = 4000
        caloriesSlider.minimumValue = 100
        caloriesSlider.setValue(2000, animated: true)
        caloriesTextField.text = "Calories"
        
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        profileNavigationBar.titleTextAttributes = [NSForegroundColorAttributeName: nandoRed]

        // Do any additional setup after loading the view.
        if let name = name {
            nameTextField.text = name
        }
        else {
            nameTextField.text = "What's Your Name?"
        }
        
        if let age = age {
            ageTextField.text = String(age)
        }
        else {
            ageTextField.text = "What's Your Age?"
        }
        
        if let weight = weight {
            weightTextField.text = String(weight)
        }
        else {
            weightTextField.text = "What's Your Weight?"
        }
        
        hideKeyboardWhenTappedAround()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: UI Text Field Delegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTextField {
            if nameTextField.text == "What's Your Name?"
            {
                textField.text = ""
                textField.textColor = UIColor.black
            }
        }
        
        else if textField == ageTextField {
            if ageTextField.text == "What's Your Age?"
            {
                textField.text = ""
                textField.textColor = UIColor.black
            }
        }
        
        else if textField == weightTextField {
            if weightTextField.text == "What's Your Weight?"
            {
                textField.text = ""
                textField.textColor = UIColor.black
            }
        }
        
        else if textField == stepsTextField {
            
            if textField.text == "Steps"
            {
                textField.text = ""
            }
            
        }
        
        else if textField == caloriesTextField {

            animateViewMoving(up: true, moveValue: 200) // need to fix with keyboardheight
            if textField.text == "Calories"
            {
                textField.text = ""
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide Keyboard    
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField {
            if textField.text == "" {
                textField.textColor = UIColor.lightGray
                textField.text = "What's Your Name?"
            }
            else {
                name = textField.text
            }
        }
        
        else if textField == ageTextField {
            if let ageInteger = textField.text?.integerValue {
                age = ageInteger
            }
            else {
                textField.textColor = UIColor.lightGray
                textField.text = "What's Your Age?"
            }
        }
        else if textField == weightTextField {
            if let weightInteger = textField.text?.integerValue {
                weight = weightInteger
            }
            else {
                textField.textColor = UIColor.lightGray
                textField.text = "What's Your Weight?"
            }
        }
        
        else if textField == stepsTextField {
            if let stepsInteger = textField.text?.integerValue {
                if stepsInteger < 5000 || stepsInteger > 25000 {
                    if stepsGoals == nil {
                        stepsTextField.text = "Steps"
                    }
                    else {
                        stepsTextField.text = String(stepsGoals!)
                    }
                }
                else {
                    stepsGoals = stepsInteger
                    stepsSlider.setValue(Float(stepsInteger), animated: true)
                }
            }
            else {
                if stepsGoals == nil {
                    stepsTextField.text = "Steps"
                }
                else {
                    stepsTextField.text = String(stepsGoals!)
                }
            }
        }
            
        else if textField == caloriesTextField {
            animateViewMoving(up: true, moveValue: -200) // need to fix
            if let caloriesInteger = textField.text?.integerValue {
                if caloriesInteger < 100 || caloriesInteger > 4000 {
                    if caloriesGoals == nil {
                        caloriesTextField.text = "Calories"
                    }
                    else {
                        caloriesTextField.text = String(caloriesGoals!)
                    }
                }
                else {
                    caloriesGoals = caloriesInteger
                    caloriesSlider.setValue(Float(caloriesInteger), animated: true)
                }
            }
            else {
                if caloriesGoals == nil {
                    caloriesTextField.text = "Calories"
                }
                else {
                    caloriesTextField.text = String(caloriesGoals!)
                }
            }
        }
    }
}
