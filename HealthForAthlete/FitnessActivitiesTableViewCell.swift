//
//  FitnessActivitiesTableViewCell.swift
//  HealthForAthlete
//
//  Created by Nick Sentjens on 2017-04-07.
//  Copyright © 2017 NickSentjens. All rights reserved.
//

import UIKit

class FitnessActivitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var activityNameTextView: UITextView!
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var howOftenValueTextView: UITextView!
    @IBOutlet weak var dayValueTextView: UITextView!
    @IBOutlet weak var durationValueTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
