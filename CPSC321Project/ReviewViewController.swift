//
//  ReviewViewController.swift
//  CPSC321Project
//
//  Created by Colson, Kellie Anne on 11/23/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    var dbHelper: DatabaseHelper? = nil

    
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var ratingSlider: UISlider!
    @IBOutlet var reviewTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitReviewButtonPressed(_ sender: UIButton) {
        let rating = ratingSlider.value
        
        if let city = cityTextField.text, let country = countryTextField.text, let review = reviewTextField.text {
            if let db = dbHelper {
            
                db.insertFeedbackSurvey(destination_city: city, destination_country: country, rating: rating, review: review)
            }
        }
        
//
//        if let username = usernameTextField.text, let password = passwordTextField.text, let name = firstNameTextField.text, let address = addressTextField.text, let city = cityTextField.text, let province = stateTextField.text, let country = countryTextField.text, let zipCode = zipcodeTextField.text {
//
//            if let db = dbHelper {
//                db.insertAccount(username: username, password: password, name: name, city: city, province: province, address: address, country: country, zipCode: Int(zipCode)!)
//            }
//        }
        
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
