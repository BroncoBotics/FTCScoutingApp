//
//  AddTeamViewController.swift
//  FTC Scouting App
//
//  Created by David Krakauer on 10/3/16.
//  Copyright © 2016 David Krakauer. All rights reserved.
//

import UIKit
import Firebase

class AddTeamViewController: UIViewController {
    
    @IBOutlet weak var teamName: UITextField!
    @IBOutlet weak var teamNumber: UITextField!
    @IBOutlet weak var teamPassword: UITextField!
    @IBOutlet weak var teamPassword2: UITextField!
    
    var ref : FIRDatabaseReference!
   // var databaseHandle : FIRDatabaseHandle?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = FIRDatabase.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpTeam(_ sender: Any) {
        ref = FIRDatabase.database().reference()
        
        if let currentUser = FIRAuth.auth()?.currentUser {
        
            ref = FIRDatabase.database().reference()
            ref.child("Teams").child(self.teamName.text!).child("Name").setValue(self.teamName.text!)
            ref.child("Teams").child(self.teamName.text!).child("Number").setValue(self.teamNumber.text!)
            ref.child("Teams").child(self.teamName.text!).child("Password").setValue(self.teamPassword.text!)
            ref.child("Teams").child(self.teamName.text!).child("memberCount").setValue(1)
            
            let userName = "member" + String(1)
            let currentUserEmail = currentUser.uid
            ref.child("Teams").child(self.teamName.text!).child("memberList").setValue([userName : currentUserEmail])

            self.ref.child("Users").child(currentUser.uid).child("teamCount").observeSingleEvent(of: .value, with: { (snapshot) in
                //code to execute upon completion
                let teamCount = snapshot.value as? Int
                if let conTeamCount = teamCount {
                    self.ref.child("Users").child(currentUser.uid).setValue(["teamCount" : conTeamCount + 1])
                    let currentTeam = "team" + String(conTeamCount + 1)
                    self.ref.child("Users").child(currentUser.uid).child("joinedTeams").child(currentTeam).setValue(self.teamName.text!)
                }
            })
            
            popViewController(self)
            
        }
            
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func popViewController(_ sender: AnyObject) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }

}
