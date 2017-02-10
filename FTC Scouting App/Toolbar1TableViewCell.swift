//
//  Toolbar1TableViewCell.swift
//  FTC Scouting App
//
//  Created by David Krakauer on 10/21/16.
//  Copyright © 2016 David Krakauer. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class Toolbar1TableViewCell: UITableViewCell {
    
    var tempNavControl : UINavigationController?

    @IBAction func signOut(_ sender: Any) {
        try! FIRAuth.auth()?.signOut()
        GIDSignIn.sharedInstance().signOut()
        
        if let navController = tempNavControl {
                navController.popViewController(animated: true)
        }
        
    }
        
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
