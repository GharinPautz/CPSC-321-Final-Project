//
//  ViewController.swift
//  CPSC321Project
//
//  Created by Gharin Pautz on 11/12/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var dbHelper = DatabaseHelper()
    var destinationHelper = DestionationInsertionHelper()

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // Startup for app
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // KELLIE DO AFTER PULL
        // Uncomment next line, run to make new account table, then delete this line
        //dbHelper.dropAccountTable()
        
        // Set up destinations table
        dbHelper.dropDestinationsTable()
        dbHelper.createDestinationsTable()
        destinationHelper.makeComprehensiveDestinationsDictionary()
        insertDestinations()
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        dbHelper.createAccountsTable()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "CreateAccountSegue" {
                print("In create account segue")
                
                if let createAccountVC = segue.destination as? CreateAccountViewController {
                    createAccountVC.dbHelper = dbHelper
                }
            } else if identifier == "loginSegue" {
                print("in login segue")
                if let homeScreenVC = segue.destination as? HomeScreenViewController {
                    homeScreenVC.dbHelper = dbHelper
                }
            }
        }
    }
    
    func insertDestinations() {
        // region: ANY
        for (region, countries) in destinationHelper.comprehensiveDestinationsDictionary {
            
            // country_code: ANY
            for (country, cities) in countries {
                
                for city in cities {
                    dbHelper.insertDestination(city: city, country_code: country, region: region, has_beaches: getRandomVal(max: 2), has_mountains: getRandomVal(max: 2), is_modern: getRandomVal(max: 2), is_historic: getRandomVal(max: 2), is_adventurous: getRandomVal(max: 2), is_relaxing: getRandomVal(max: 2), is_family_friendly: getRandomVal(max: 2), need_travel_companion: getRandomVal(max: 2), avg_cost: getRandomVal(max: 11))
                }
            }
        }
    }
    
    func getRandomVal(max: Int) -> Int {
        let num = Int(arc4random_uniform(UInt32(max)))
        return num
    }
}

