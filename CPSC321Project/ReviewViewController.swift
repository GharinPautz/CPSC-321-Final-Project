//
//  ReviewViewController.swift
//  CPSC321Project
//
//  Created by Colson, Kellie Anne on 11/23/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    var dbHelper: DatabaseHelper? = nil

    
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var countryCodePicker: UIPickerView!
    @IBOutlet var ratingSlider: UISlider!
    @IBOutlet var reviewTextView: UITextView!
    
    var countryCodePickerData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        if let dbHelperUnwrapped = dbHelper {
            countryCodePickerData = dbHelperUnwrapped.getAllCountryCodes()
            print(countryCodePickerData)
        }
        self.countryCodePicker.delegate = self
        self.countryCodePicker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCodePickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryCodePickerData[row]
    }
    

    @IBAction func submitReviewButtonPressed(_ sender: UIButton) {
        let rating = ratingSlider.value
        
        if let city = cityTextField.text, let review = reviewTextView.text {
            if let db = dbHelper {
                let country = countryCodePickerData[countryCodePicker.selectedRow(inComponent: 0)]
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
