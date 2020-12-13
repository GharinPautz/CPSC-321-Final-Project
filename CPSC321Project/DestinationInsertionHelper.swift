//
//  DestinationInsertionHelper.swift
//  CPSC321Project
//
//  Created by Gharin Pautz on 12/13/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import Foundation

class DestionationInsertionHelper {
    var comprehensiveDestinationsDictionary = [String: [String:[String]]]()
    var northAmerica = [String:[String]]()
    var europe = [String:[String]]()
    
    let regions = ["North America", "Europe", "South America", "Central America", "Asia", "Africa", "Middle East", "Oceania"]
    
    // - MARK: North America
    let northAmericanCountries = ["CA", "US", "MX"]
    let canadianCities = ["Toronto", "Vancouver", "Edmonton", "Calgary", "Victoria", "Ottawa", "Quebec City"]
    let americanCities = ["Seattle", "Anchorage", "Honolulu", "Portland", "Los Angeles", "San Francisco", "Phoenix", "Dallas", "Denver", "Minneapolis", "Columbus", "Miami", "Atlanta", "Charleston", "Salt Lake City", "Orlando", "New York", "Boston", "Augusta", "Billings", "Indianapolis", "Detroit", "Chicago", "Madison", "Charlotee", "Houston", "Austin", "Oklahoma City", "Lexington", "Philadelphia", "Cleveland", "Spokane"]
    let mexicanCities = ["Mexico City", "Guadalajara", "Puerto Vallarta", "Cancun", "Tijuana"]
    
    // - MARK: Europe
    
    
    
    func makeNorthAmericaDictionary() -> [String:[String]] {
        for country in northAmericanCountries {
            switch country {
            case "CA":
                northAmerica[country] = canadianCities
            case "US":
                northAmerica[country] = americanCities
            default:
                northAmerica[country] = mexicanCities
            }
        }
        return northAmerica
    }
    
    func makeComprehensiveDestinationsDictionary() -> [String: Any] {
        makeNorthAmericaDictionary()
        
        for region in regions {
            switch region {
            case "North America":
                comprehensiveDestinationsDictionary[region] = northAmerica
            case "Europe":
                comprehensiveDestinationsDictionary[region] = europe
            default:
                comprehensiveDestinationsDictionary[region] = northAmerica
            }
        }
        
        return comprehensiveDestinationsDictionary
    }
}
