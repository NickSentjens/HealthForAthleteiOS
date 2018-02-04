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
        
        tabBar.items?[0].title = "Your Day"
        tabBar.items?[1].title = "Your Calender"
        tabBar.items?[2].title = " Profile"
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: nandoRed], for: .selected)
                UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
