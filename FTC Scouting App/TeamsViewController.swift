//
//  TeamsViewController.swift
//  FTC Scouting App
//
//  Created by David Krakauer on 10/3/16.
//  Copyright © 2016 David Krakauer. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseAnalytics


class TeamsViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        /*FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
            if let user = user {
                // User is signed in.
                user.
            } else {
                // No user is signed in.
            }*/
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Toolbar1TableViewCell", for: indexPath)
            return cell
        }else if indexPath.row > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TeamTableViewCell", for: indexPath)
            //RIGHT HERE
            
        return cell
        }
        
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
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

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
