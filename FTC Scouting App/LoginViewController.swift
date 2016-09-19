//
//  LoginViewController.swift
//  FTC Scouting App
//
//  Created by David Krakauer on 9/16/16.
//  Copyright © 2016 David Krakauer. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    var ref: Firebase?
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Firebase(url: "https://ftc-scouting-app.firebaseio.com/")
        // Setup delegates
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        // Attempt to sign in silently, this will succeed if
        // the user has recently been authenticated
        GIDSignIn.sharedInstance().signInSilently()
    }
    // Wire up to a button tap
    @IBAction func authenticateWithGoogle(sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    func signOut() {
        GIDSignIn.sharedInstance().signOut()
        ref.unauth()
    }
    // Implement the required GIDSignInDelegate methods
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
            // Auth with Firebase
            ref.authWithOAuthProvider("google", token: user.authentication.accessToken, withCompletionBlock: { (error, authData) in
                // User is logged in!
            })
        } else {
            // Don't assert this error it is commonly returned as nil
            print("\(error.localizedDescription)")
        }
    }
    // Implement the required GIDSignInDelegate methods
    // Unauth when disconnected from Google
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
                withError error: NSError!) {
        ref.unauth();
    }
}