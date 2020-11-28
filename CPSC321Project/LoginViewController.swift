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

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        //dbHelper.createAccountsTable()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "CreateAccountSegue" {
                print("In create account segue")
                
                if let createAccountVC = segue.destination as? CreateAccountViewController {
                    createAccountVC.dbHelper = dbHelper
                }
            }
        }
    }
}

