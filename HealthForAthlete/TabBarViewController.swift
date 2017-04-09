//
//  TabBarViewController.swift
//  HealthForAthlete
//
//  Created by Nick Sentjens on 2017-03-31.
//  Copyright © 2017 NickSentjens. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    let nandoRed: UIColor = UIColor(colorLiteralRed: 188/255, green: 23/255, blue: 23/255, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Setting tab bar titles and Images
        
        
        /*tabBar.items?[0].title = "Today"
        tabBar.items?[1].title = "Schedules"
        tabBar.items?[2].title = " Profile"
        
        tabBar.items?[0].image = UIImage(named: "check.png")
        tabBar.items?[1].image = UIImage(named: "ScheduleIcon.png")
        tabBar.items?[2].image = UIImage(named: "Icon-24.png")*/
        
        let selectedStateImages = ["selectedCheckIcon.png", "selectedScheduleIcon.png", "selectedProfileIcon.png"]
        let unselectedStateImages = ["checkIcon.png", "scheduleIcon.png", "profileIcon.png"]
        
        if let count = self.tabBar.items?.count {
            for i in 0...(count-1) {
                let imageNameForSelectedState   = selectedStateImages[i]
                let imageNameForUnselectedState = unselectedStateImages[i]
                
                self.tabBar.items?[i].selectedImage = UIImage(named: imageNameForSelectedState)?.withRenderingMode(.alwaysOriginal)
                self.tabBar.items?[i].image = UIImage(named: imageNameForUnselectedState)?.withRenderingMode(.alwaysOriginal)
            }
        }
        
        /*let selectedColor   = UIColor(red: 246.0/255.0, green: 155.0/255.0)
        let unselectedColor = UIColor(red: 16.0/255.0, green: 224.0/255.0, blue: 223.0/255.0, alpha: 1.0)*/
        
        tabBar.items?[0].title = "Today"
        tabBar.items?[1].title = "Schedules"
        tabBar.items?[2].title = " Profile"
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: nandoRed], for: .selected)
                UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: .normal)
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
