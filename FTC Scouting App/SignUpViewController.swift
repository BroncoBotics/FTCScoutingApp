//
//  SignUpViewController.swift
//  FTC Scouting App
//
//  Created by David Krakauer on FTC_Scouting_App 9/30/16.
//  Copyright © 2016 David Krakauer. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class SignUpViewController: UIViewController {
    
    

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailField2: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordField2: UITextField!
    
    
    
    
   
    @IBAction func didSignUp(_ sender: Any) {
        
        var sectionsAreFilled = false
        var sectionsAreMatched = false
        
        if nameField.text == "" {
            let alert = UIAlertController(title: "Error" , message: "Please fill in your name", preferredStyle: .alert)
            let actio1n = UIAlertAction(title: "Ok" , style: .cancel , handler: nil)
            alert.addAction(actio1n)
            present(alert, animated: true, completion: nil)
        } else if emailField.text == "" {
            let alert = UIAlertController(title: "Error" , message: "Please fill in your email", preferredStyle: .alert)
            let actio1n = UIAlertAction(title: "Ok" , style: .cancel , handler: nil)
            alert.addAction(actio1n)
            present(alert, animated: true, completion: nil)
        } else if emailField2.text == "" {
            let alert = UIAlertController(title: "Error" , message: "Please confirm your email", preferredStyle: .alert)
            let actio1n = UIAlertAction(title: "Ok" , style: .cancel , handler: nil)
            alert.addAction(actio1n)
            present(alert, animated: true, completion: nil)
        } else if passwordField.text == "" {
            let alert = UIAlertController(title: "Error" , message: "Please enter a password", preferredStyle: .alert)
            let actio1n = UIAlertAction(title: "Ok" , style: .cancel , handler: nil)
            alert.addAction(actio1n)
            present(alert, animated: true, completion: nil)
        } else if passwordField2.text == "" {
            let alert = UIAlertController(title: "Error" , message: "Please confirm your password", preferredStyle: .alert)
            let actio1n = UIAlertAction(title: "Ok" , style: .cancel , handler: nil)
            alert.addAction(actio1n)
            present(alert, animated: true, completion: nil)
        } else {
            sectionsAreFilled = true
            print("Sections are filled")
        }
        
        
        if passwordField.text != passwordField2.text {
            let alert = UIAlertController(title: "Error" , message: "Your passwords do not match", preferredStyle: .alert)
            let actio1n = UIAlertAction(title: "Ok" , style: .cancel , handler: nil)
            alert.addAction(actio1n)
            present(alert, animated: true, completion: nil)
        } else if emailField.text != emailField2.text {
            let alert = UIAlertController(title: "Error" , message: "Your emails do not match", preferredStyle: .alert)
            let actio1n = UIAlertAction(title: "Ok" , style: .cancel , handler: nil)
            alert.addAction(actio1n)
            present(alert, animated: true, completion: nil)
        } else {
            sectionsAreMatched = true
            print("Sections are matching")
        }
        
        if sectionsAreFilled && sectionsAreMatched {
            
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user: FIRUser?, error) in
                if error == nil {
                    print("logged in as " + self.nameField.text!)
                    FIRAnalytics.setUserPropertyString(self.nameField.text!, forName: "realName")
                    self.performSegue(withIdentifier: "updatedSignIn", sender: self)
                }else{
                    print("sign up failed")
                    print(error!)
                    //registration failure
                }
            })
        }
    
    
    
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
    @IBAction func popViewController(_ sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
            
        }
    }

}
