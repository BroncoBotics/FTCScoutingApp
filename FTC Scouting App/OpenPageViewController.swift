//
//  OpenPageViewController.swift
//  FTC Scouting App
//
//  Created by David Krakauer on 10/20/16.
//  Copyright © 2016 David Krakauer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class OpenPageViewController: UIViewController {
    override func viewDidLoad() {
        
        print("FTC Scouting App Opened!")
        print("Loading Open Page ...")
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if ((user) != nil) {
                print("User has already logged in ... Moving to Teams View Page")
                // User is signed in.
                self.performSegue(withIdentifier: "loggedIn", sender: self)
            } else {
                print("No user identified ... waiting for user interaction")
                // No user is signed in.
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
