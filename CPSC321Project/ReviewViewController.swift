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
    @IBOutlet var reviewTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitReviewButtonPressed(_ sender: UIButton) {
        let rating = ratingSlider.value
        
        if let city = cityTextField.text, let country = countryTextField.text, let review = reviewTextView.text {
            if let db = dbHelper {
                let queryStr = "SELECT city, country_code FROM Destinations WHERE city = \"\(city)\" AND country_code = \"\(country)\""
                let result = db.existsQuery(withQuery: queryStr)
                if result {
                    // destination exists in destinations table
                    print("desination exists, inserting review")
                    db.insertReview(destination_city: city, destination_country_code: country, rating: rating, review: review)
                } else {
                    // destination does not exist in Destinations table
                    print("destination does not exist")
                    let alertController: UIAlertController = UIAlertController(title: "Destination does not exist", message: "A destination with the given city and country code does not exist in our database", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alertController, animated: true, completion: nil)
                }
            }
        }
        
        
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
