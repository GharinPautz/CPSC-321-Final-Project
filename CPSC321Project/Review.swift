//
//  Review.swift
//  CPSC321Project
//
//  Created by Gharin Pautz on 12/14/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import Foundation

class Review {
    // c.country_name, d.city, r.review
    var city: String
    var country: String
    var message: String
    var rating: Int
    
    init(city: String, country: String, message: String, rating: Int) {
        self.city = city
        self.country = country
        self.message = message
        self.rating = rating
    }
}
