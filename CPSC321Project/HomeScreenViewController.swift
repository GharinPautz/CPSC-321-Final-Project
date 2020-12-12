//
//  HomeScreenViewController.swift
//  CPSC321Project
//
//  Created by Colson, Kellie Anne on 11/23/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    var dbHelper: DatabaseHelper? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func findDestinationButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func reviewDestinationButtonPressed(_ sender: UIButton) {
        dbHelper?.createFeedbackSurveyTable()
    }
    
    
    @IBAction func viewPastResultsButtonPressed(_ sender: UIButton) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "reviewSegue" {
                print("In review segue")
                
                if let reviewVC = segue.destination as? ReviewViewController {
                    reviewVC.dbHelper = dbHelper
                }
            } 
        }
    }

}
