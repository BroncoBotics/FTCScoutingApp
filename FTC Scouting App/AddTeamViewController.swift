//
//  AddTeamViewController.swift
//  FTC Scouting App
//
//  Created by David Krakauer on 10/3/16.
//  Copyright © 2016 David Krakauer. All rights reserved.
//

import UIKit

class AddTeamViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
