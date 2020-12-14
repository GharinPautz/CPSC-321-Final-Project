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
            
                db.insertReview(destination_city: city, destination_country_code: country, rating: rating, review: review)
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
