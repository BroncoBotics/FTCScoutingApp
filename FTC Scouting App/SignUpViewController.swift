//
//  SignUpViewController.swift
//  FTC Scouting App
//
//  Created by David Krakauer on 9/30/16.
//  Copyright © 2016 David Krakauer. All rights reserved.
//

import UIKit
import Foundation


class SignUpViewController: UIViewController {

    
    override func viewDidLoad(){
    
    }
    
    @IBAction func popViewController(_ sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}
