//
//  SchedulesViewController.swift
//  HealthForAthlete
//
//  Created by Nick Sentjens on 2017-03-30.
//  Copyright © 2017 NickSentjens. All rights reserved.
//

import UIKit

class SchedulesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let nandoRed: UIColor = UIColor(colorLiteralRed: 188/255, green: 23/255, blue: 23/255, alpha: 1.0)
    
    @IBOutlet weak var schedulesNavigationBar: UINavigationBar!
    
    let cellIdentifier = "CellIdentifier"
    var activities: [FitnessActivity] = []
    var fruits: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        schedulesNavigationBar.titleTextAttributes = [NSForegroundColorAttributeName: nandoRed]
        
        var baseballActivity: FitnessActivity = FitnessActivity(activityName: "Baseball", activityPhoto: nil, howOften: "Weekly", dayValue: "Every Wednesday", howManyHours: 1.5)!
        
        //fruits = ["Apple", "Pineapple", "Orange", "Blackberry", "Banana", "Pear", "Kiwi", "Strawberry", "Mango", "Walnut", "Apricot", "Tomato", "Almond", "Date", "Melon", "Water Melon", "Lemon", "Coconut", "Fig", "Passionfruit", "Star Fruit", "Clementin", "Citron", "Cherry", "Cranberry"]
        
        activities.append(baseballActivity)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tableView: UITableView!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
        //return fruits.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: FitnessActivitiesTableViewCell
        
        cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! FitnessActivitiesTableViewCell
        
        // Fetch activity
        let activity = activities[indexPath.row]
        
        // Configure Cell
        cell.activityNameTextView.text = activity.activityName
        cell.activityImage.image = activity.activityPhoto
        cell.howOftenValueTextView.text = activity.howOften
        cell.dayValueTextView.text = activity.dayValue
        cell.durationValueTextView.text = String(activity.howManyHours)
        
        
        /*// Fetch Fruit
        let fruit = fruits[indexPath.row]
        
        // Configure Cell
        cell.textLabel?.text = fruit*/
        
        return cell
    }
    
    
    
}

//extension SchedulesViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 4
//    }
//}
//
//extension SchedulesViewController: UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
//    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//}
