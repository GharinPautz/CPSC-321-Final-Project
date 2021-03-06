//
//  CreateAccountViewController.swift
//  CPSC321Project
//
//  Created by Colson, Kellie Anne on 11/23/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    var dbHelper: DatabaseHelper? = nil

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var zipcodeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Account"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        if let username = usernameTextField.text, let password = passwordTextField.text, let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, let address = addressTextField.text, let city = cityTextField.text, let countryCode = countryTextField.text, let zipCode = zipcodeTextField.text {
            
            if let db = dbHelper {
                db.insertAccount(username: username, password: password, firstName: firstName, lastName: lastName, address: address, city: city, countryCode: countryCode, zipCode: Int(zipCode)!)
            }
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
