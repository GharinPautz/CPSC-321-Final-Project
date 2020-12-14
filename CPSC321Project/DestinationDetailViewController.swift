//
//  DestinationDetailViewController.swift
//  CPSC321Project
//
//  Created by Colson, Kellie Anne on 11/23/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class DestinationDetailViewController: UIViewController {
    var dbHelper: DatabaseHelper? = nil
    var destination: Destination? = nil
    var reviews: [Review]? = nil
    var currIndex = 0
    var avgRating: Float = 0.0

    @IBOutlet var destinationNameLabel: UILabel!
    @IBOutlet var reviewNumberLabel: UILabel!
    @IBOutlet var reviewLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var averageRatingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getAverageRating()
        getReviews()
        updateUI()
        print("Average: \(avgRating)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func getReviews() {
        
        if let place = destination {
            
            let queryStr = "SELECT c.country_name, d.city, r.review, r.rating FROM Country c JOIN Destinations d USING (country_code) JOIN Review r ON (d.city = r.destination_city) WHERE d.city = '\(place.city)'"
            
            print(queryStr)
            
            reviews = dbHelper?.findReviews(fromQuery: queryStr)
            
            print(reviews?.count)
        }
    }
    
    func getAverageRating() {
        
        if let place = destination {
            let queryStr = "SELECT AVG(r.rating) FROM Destinations d JOIN Review r ON (d.city = r.destination_city) WHERE d.city = '\(place.city)'"
            
            print(queryStr)
            
            var avg = dbHelper?.getAverageRating(queryStr: queryStr)
            
            if let ratingAvg = avg {
                avgRating = ratingAvg
            }
        }
    }
    
    @IBAction func nextButtonPressed() {
        if let reviewsArray = reviews {
            currIndex = (currIndex + 1) % reviewsArray.count
        }
        updateUI()
    }
    
    func updateUI() {
        if let reviewsArray = reviews {
            if reviewsArray.count != 0 {
                destinationNameLabel.text = "\(reviewsArray[currIndex].city), \(reviewsArray[currIndex].country)"
                reviewNumberLabel.text = "Review \(currIndex + 1) of \(reviewsArray.count)"
                reviewLabel.text = "\(reviewsArray[currIndex].message)"
                ratingLabel.text = "Review Rating: \(reviewsArray[currIndex].rating)⭐️ out of 5⭐️"
                averageRatingLabel.text = "Average Rating: \(avgRating)⭐️"
            }
            else {
                if let place = destination {
                    destinationNameLabel.text = "\(place.city), \(place.countryCode)"
                    reviewNumberLabel.text = ""
                    reviewLabel.text = "No reviews for \(place.city) yet. How about you add one?"
                    ratingLabel.text = ""
                    averageRatingLabel.text = ""
                }
            }
        }
    }
}
