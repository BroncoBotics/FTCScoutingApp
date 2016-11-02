//
//  TeamTableViewCell.swift
//  FTC Scouting App
//
//  Created by David Krakauer on 10/31/16.
//  Copyright © 2016 David Krakauer. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var userCount: UILabel!
    @IBOutlet weak var teamNumber: UILabel!
    
    func viewDidLoad() {
        
    }
    
    func loadTeamCell(Name: String, Number: Int, memCount: Int){
        teamName.text = Name
        userCount.text = String(memCount)
        teamNumber.text = String(Number)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
