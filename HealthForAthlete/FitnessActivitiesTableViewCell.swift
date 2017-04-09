//
//  FitnessActivitiesTableViewCell.swift
//  HealthForAthlete
//
//  Created by Nick Sentjens on 2017-04-07.
//  Copyright © 2017 NickSentjens. All rights reserved.
//

import UIKit

class FitnessActivitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var activityNameTextField: UITextField!
    
    @IBOutlet weak var activityUIImage: UIImageView!
    
    @IBOutlet weak var howOftenValueTextField: UITextField!
    
    @IBOutlet weak var dayValueTextField: UITextField!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
