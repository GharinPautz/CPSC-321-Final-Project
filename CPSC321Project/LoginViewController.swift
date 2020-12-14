//
//  ViewController.swift
//  CPSC321Project
//
//  Created by Gharin Pautz on 11/12/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit
import SQLite3

class LoginViewController: UIViewController {
    var dbHelper = DatabaseHelper()
    var destinationHelper = DestionationInsertionHelper()
    var countryHelper = CountryInsertionHelper()

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // Startup for app
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dbHelper.dropDestinationsTable()
        //dbHelper.dropReviewsTable()
        
        dbHelper.createDestinationsTable()
        dbHelper.createCountryTable()
        dbHelper.createAccountsTable()
        dbHelper.createReviewsTable()
        destinationHelper.makeComprehensiveDestinationsDictionary()
        dbHelper.insertDestination(city: "Kona", country_code: "US", region: "North America", has_beaches: 1, has_mountains: 1, is_modern: 1, is_historic: 0, is_adventurous: 1, is_relaxing: 1, is_family_friendly: 1, need_travel_companion: 0, avg_cost: 8)
        insertDestinations()
        insertCountries()

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSegue" {
            // check username exists & password matches
            // get entered username & password
            if let username = usernameTextField.text, let password = passwordTextField.text {
                let queryStr = "SELECT username, password FROM Account WHERE username = \"\(username)\" AND password = \"\(password)\""
                let result = dbHelper.existsQuery(withQuery: queryStr)
                if result {
                    // username exists & password matches
                    print("username exists & password matches")
                    return true
                } else {
                    // username does not exist or password does not match- do not login user
                    print("username doesn't exist")
                    let alertController: UIAlertController = UIAlertController(title: "Incorrect login information", message: "There is no account with the given account information", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alertController, animated: true, completion: nil)
                    return false
                }
            }

        }
        return true
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
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
    
    func insertCountries() {
        for (code, country) in countryHelper.countries {
            dbHelper.insertCountry(countryCode: code, countryName: country)
        }
    }
}

