//
//  OpenPageViewController.swift
//  FTC Scouting App
//
//  Created by David Krakauer on 10/20/16.
//  Copyright © 2016 David Krakauer. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class OpenPageViewController: UIViewController, GIDSignInUIDelegate {
    override func viewDidLoad() {
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if GIDSignIn.sharedInstance().currentUser != nil {
            print("Google Sign In recieved")
            
            if let user = GIDSignIn.sharedInstance().currentUser{
                guard let authentication = user.authentication else { return }
                let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken,accessToken: authentication.accessToken)
                
                
                FIRAuth.auth()?.signIn(with: credential) { (user, error) in
                    // ...
                    if let error1 = error {
                        print(error1)
                        print("Error: Could not authenticate Google User")
                        return
                    } else {
                        print("Google User succesfully authenticated")
                        
                        if let name = user?.displayName {
                            print("Display Name: " + name)
                        }
                        
                        self.performSegue(withIdentifier: "loggedIn", sender: self)
                    }
                }
                
                
            } else {
                print("")
                print("Error: Google Authentication Failed")
                print("Error recieved from OpenPageViewController.swift")
                print("")
            }
            
        } else if FIRAuth.auth()?.currentUser != nil {
            if let user = FIRAuth.auth()?.currentUser {
                let name = user.displayName
                let email = user.email
                
                print("User already signed in and authenticated")
                print("User Information")
                print("Display Name: " + name!)
                print("Email: " + email!)
                
                self.performSegue(withIdentifier: "loggedIn", sender: self)
            }
        } else {
            print("No User Exsists")
        }
    }
    
   
    
    
    
    
   /* @IBAction func signOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        try! FIRAuth.auth()!.signOut()
        
    }*/
    
    /*@IBAction func checkUsers(_ sender: Any) {
        if FIRAuth.auth()?.currentUser != nil {
            print("Firebase User Exsists")
        
        } else {
            print("No Firebase User")
        }
            
        if GIDSignIn.sharedInstance().currentUser != nil {
            print("Google user Identified")
        } else {
            print("No Google User")
        }
        
        
    }*/
    
    
    
    
    
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        print("errorcode2")
        if let err = error {
            print(err)
        }
        else {
            performSegue(withIdentifier: "loggedIn", sender: self)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
