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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         
        dbHelper.dropTable()
        destinationHelper.makeComprehensiveDestinationsDictionary()
        dbHelper.createDestinationsTable()
        dbHelper.insertDestination(city: "Kona", country_code: "US", region: "North America", has_beaches: 1, has_mountains: 1, is_modern: 1, is_historic: 1, is_adventurous: 1, is_relaxing: 1, is_family_friendly: 1, need_travel_companion: 0, avg_cost: 8)
        insertDestinations()
 
        
        //print(destinationHelper.comprehensiveDestinationsDictionary)
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
        for (region, value) in destinationHelper.comprehensiveDestinationsDictionary {
            
            // country_code: ANY
            for (country, cities) in value {
                
                for city in cities {
                    dbHelper.insertDestination(city: city, country_code: country, region: region, has_beaches: getRandomVal(max: 2), has_mountains: getRandomVal(max: 2), is_modern: getRandomVal(max: 2), is_historic: getRandomVal(max: 2), is_adventurous: getRandomVal(max: 2), is_relaxing: getRandomVal(max: 2), is_family_friendly: getRandomVal(max: 2), need_travel_companion: getRandomVal(max: 2), avg_cost: getRandomVal(max: 11))
                }
            }
        }
        
        /*
        for country in destinationHelper.northAmericanCountries {
            switch country {
            case "CA":
                for city in destinationHelper.canadianCities {
                    dbHelper.insertDestination(city: city, country_code: country, region: destinationHelper.region1, has_beaches: getRandomVal(max: 2), has_mountains: getRandomVal(max: 2), is_modern: getRandomVal(max: 2), is_historic: getRandomVal(max: 2), is_adventurous: getRandomVal(max: 2), is_relaxing: getRandomVal(max: 2), is_family_friendly: getRandomVal(max: 2), need_travel_companion: getRandomVal(max: 2), avg_cost: getRandomVal(max: 11))
                }
            case "US":
                for city in destinationHelper.americanCities {
                    dbHelper.insertDestination(city: city, country_code: country, region: destinationHelper.region1, has_beaches: getRandomVal(max: 2), has_mountains: getRandomVal(max: 2), is_modern: getRandomVal(max: 2), is_historic: getRandomVal(max: 2), is_adventurous: getRandomVal(max: 2), is_relaxing: getRandomVal(max: 2), is_family_friendly: getRandomVal(max: 2), need_travel_companion: getRandomVal(max: 2), avg_cost: getRandomVal(max: 11))
                }
            default:
                for city in destinationHelper.mexicanCities {
                    dbHelper.insertDestination(city: city, country_code: country, region: destinationHelper.region1, has_beaches: getRandomVal(max: 2), has_mountains: getRandomVal(max: 2), is_modern: getRandomVal(max: 2), is_historic: getRandomVal(max: 2), is_adventurous: getRandomVal(max: 2), is_relaxing: getRandomVal(max: 2), is_family_friendly: getRandomVal(max: 2), need_travel_companion: getRandomVal(max: 2), avg_cost: getRandomVal(max: 11))
                }
            }
        }
 */
    }
    
    func getRandomVal(max: Int) -> Int {
        let num = Int(arc4random_uniform(UInt32(max)))
        return num
    }
}

