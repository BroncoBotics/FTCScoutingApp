//
//  ViewController.swift
//  FTC Scouting App
//
//  Created by David Krakauer on 8/18/16.
//  Copyright © 2016 David Krakauer. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseAuth
//import GoogleSignIn


class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Automatically sign in the user.
        GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
    
    @IBAction func didTapSignIn(_ sender: AnyObject) {
        // Sign In with credentials.
        guard let email1 = emailField.text, let password1 = passwordField.text else { return }
        FIRAuth.auth()?.signIn(withEmail: email1, password: password1) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func popViewController(_ sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
 
    
}

