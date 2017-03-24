//
//  TeamsViewController.swift
//  FTC Scouting App
//
//  Created by David Krakauer on 10/3/16.
//  Copyright © 2016 David Krakauer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class TeamsViewController: UITableViewController {

    var ref: FIRDatabaseReference?
    var teamData = [String]()
    var teamCount = 0
    var hasfilled = false
    var firstRun = false
    var currentUser = FIRAuth.auth()?.currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        ref = FIRDatabase.database().reference()
        //let currentUser = FIRAuth.auth()?.currentUser
        
        //Load the teamCount
       // ref?.child("Users").child(currentUser!.uid).child("teamCount").obser
        
        //Load each team
        
        let path = ref?.child("Users").child(currentUser!.uid).child("joinedTeams")
        path?.observeSingleEvent(of: .value, with: { (snapshot) in
            
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? FIRDataSnapshot{
                let teamName = rest.value as? String
                if let teamNameData = teamName {
                    self.teamData.append(teamNameData)
                    self.teamCount += 1
                    
                }
            }
            
            
            
            let tempPreCount = snapshot.childrenCount
            if self.teamCount == Int(tempPreCount) {
                print("asdas")
                self.tableView.reloadData()
                
            }
            
            /*let teamName = snapshot.value as? String
            if let teamNameData = teamName {
                self.teamData.append(teamNameData)
                self.tableView.reloadData()
            }*/
        })
        
        
        /*
        if hasfilled == true {
            tableView.reloadData()
        }
        */
        
    }
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.teamCount + 1)
        /*
        if self.currentUser == nil {
            self.currentUser = FIRAuth.auth()?.currentUser
        }
        if self.ref == nil {
            self.ref? = FIRDatabase.database().reference()
        }
      //  while (self.hasfilled == false){
            if self.hasfilled == false {
                if self.firstRun == false {
                    self.firstRun = true
                    self.ref?.child("Users").child(self.currentUser!.uid).child("teamCount").observeSingleEvent(of: .value, with: { (snapshot) in
                
                        let teamcount = snapshot.value as? Int
                        if let teamCount1 = teamcount {
                            self.teamCount = teamCount1 + 1
                            self.hasfilled = true
                        }
                    })
                }
        
            }
        //}
            
        return self.teamCount
        */
    }
    
   /* override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ref = FIRDatabase.database().reference()
        var teamArray = [String]()
        
        if let User = FIRAuth.auth()?.currentUser {
            ref.child("users").child(User.uid).child("teamIDs").queryOrderedByKey("team").observ
                
            
        }
  
    }*/

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Toolbar1TableViewCell", for: indexPath) as! Toolbar1TableViewCell
            cell.tempNavControl = self.navigationController
            cell.superClass = self
            return cell
        }else if indexPath.row > 0 && indexPath.row <= self.teamData.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TeamTableViewCell", for: indexPath) as? TeamTableViewCell
            //RIGHT HERE
            if let Cell = cell {
                //let currentUser = FIRAuth.auth()?.currentUser
                let currentTeamID = self.teamData[indexPath.row-1]
                Cell.teamName.text = currentTeamID
                Cell.frame.size.height = 100
                if indexPath.row == 1 {
                    print("1")
                }
                if indexPath.row == 2 {
                    print("2")
                }
                self.ref?.child("Teams").child(currentTeamID).child("Number").observeSingleEvent(of: .value, with: { (snapshot) in
                    let number1 = snapshot.value as? Int
                    if let teamNum = number1 {
                        Cell.teamNumber.text = String(teamNum)
                    }
                })
                self.ref?.child("Teams").child(currentTeamID).child("memberCount").observeSingleEvent(of: .value, with: { (snapshot) in
                    let memcon = snapshot.value as? Int
                    if let membercount = memcon {
                        Cell.userCount.text = "Members: " + String(membercount)
                    }
                })
                
            }
            
            /*
            let path = self.ref?.child("Users").child(currentUser!.uid).child("joinedTeams")
            let teamAppendedNumber = "team" + String(indexPath.row)
            let pathA = path?.child(teamAppendedNumber)
            pathA?.observeSingleEvent(of: .value, with: { (snapshot) in
                let teamID = snapshot.value as? String
                if let teamid = teamID {
                    Cell.teamName.text = teamid
                    Cell.frame.size.height = 100
                    self.ref?.child("Teams").child(teamid).child("Number").observeSingleEvent(of: .value, with: { (snapshot) in
                        let number1 = snapshot.value as? Int
                        if let teamNum = number1 {
                            Cell.teamNumber.text = String(teamNum)
                        }
                    })
                    self.ref?.child("Teams").child(teamid).child("memberCount").observeSingleEvent(of: .value, with: { (snapshot) in
                        let memcon = snapshot.value as? Int
                        if let membercount = memcon {
                            Cell.userCount.text = "Members: " + String(membercount)
                        }
                    })
                    
                    //pathB = ref?.child("Teams").child(teamid).
                }
            })*/
        
        }
        tableView.reloadData()
        let cell = tableView.dequeueReusableCell(withIdentifier: "Toolbar1TableViewCell", for: indexPath)
        return cell
        

        // Configure the cell...
        
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, move    RowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
