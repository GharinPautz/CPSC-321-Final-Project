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
    var asia = [String:[String]]()
    var africa = [String:[String]]()
    var centralAmerica = [String:[String]]()
    var southAmerica = [String:[String]]()
    var oceania = [String:[String]]()
    var middleEast = [String:[String]]()
    
    let regions = ["North America", "Europe", "South America", "Central America", "Asia", "Africa", "Middle East", "Oceania"]
    
    // - MARK: North America
    let northAmericanCountries = ["CA", "US", "MX"]
    let canadianCities = ["Toronto", "Vancouver", "Edmonton", "Calgary", "Victoria", "Ottawa", "Quebec City"]
    let americanCities = ["Seattle", "Anchorage", "Honolulu", "Portland", "Los Angeles", "San Francisco", "Phoenix", "Dallas", "Denver", "Minneapolis", "Columbus", "Miami", "Atlanta", "Charleston", "Salt Lake City", "Orlando", "New York", "Boston", "Augusta", "Billings", "Indianapolis", "Detroit", "Chicago", "Madison", "Charlotee", "Houston", "Austin", "Oklahoma City", "Lexington", "Philadelphia", "Cleveland", "Spokane"]
    let mexicanCities = ["Mexico City", "Guadalajara", "Puerto Vallarta", "Cancun", "Tijuana"]
    
    // - MARK: Europe
    let europeanCountries = ["GB", "DK", "IT", "FR", "DE", "SE", "ES", "PT"]
    let britishCitiess = ["London", "Manchester", "Liverpool", "Edinburgh", "Cardiff", "Glasgow"]
    let danishCities = ["Copenhagen", "Aarhus", "Aalborg", "Elsinore"]
    let italianCities = ["Milan", "Rome", "Venice", "Florence", "Sicily", "Bergamo"]
    let frenchCities = ["Paris", "Nice", "Marseille", "Bordeaux", "Strasbourg"]
    let germanCities = ["Hamburg", "Munich", "Berlin", "Frankfurt", "Cologne", "Dusseldork", "Dresden"]
    let swedishCities = ["Stockholm", "Malmo", "Gothenburg", "Lund"]
    let spanishCities = ["Grenada", "Barcelona", "Madrid", "Seville", "Ibiza"]
    let portugueseCities = ["Lisbon", "Porto", "Braga"]
    
    // - MARK: Asia
    let asianCountries = ["JP", "CN", "IN", "KR"]
    let japaneseCities = ["Tokyo", "Okinawa", "Osaka", "Kyoto"]
    let chineseCities = ["Beijing", "Shanghai", "Shenzhen"]
    let indianCities = ["Mumbai", "Bengaluru", "Chennai"]
    let koreanCities = ["Seoul", "Busan", "Daegu"]
    
    // - MARK: Africa
    let africanCountries = ["ZA", "KE", "EG"]
    let southAfricanCities = ["Johannesburg", "Cape Town", "Durban", "Preoria"]
    let kenyanCities = ["Nairobi", "Kisumu", "Eldoret"]
    let egyptianCities = ["Cairo", "Alexandria", "Luxor"]
    
    // - MARK: Central America
    let centralAmericanCountries = ["GT", "PA", "BZ"]
    let guatemalaCities = ["Guatemala City", "Flores", "Quetzaltenango"]
    let panamaCities = ["Panama City", "Santiago", "David"]
    let belizeCities = ["Belize City", "San Pedro", "San Ignacio"]
    
    // - MARK: South America
    let southAmericanCountries = ["BR", "AR", "CL"]
    let brazilCities = ["Rio De Janeiro", "Sao Paulo", "Brasilia", "Salvador"]
    let argentinaCities = ["Buenos Aires", "Mendoza", "Salta"]
    let chileCities = ["Santiago", "valparaiso", "La Serena"]
    
    // - MARK: Oceania
    let oceaniaCountries = ["AU", "NZ"]
    let australiaCities = ["Melbourne", "Sydney", "Perth", "Adelaide", "Brisbane"]
    let newZealandCities = ["Auckland", "Wellington", "Chirstchurch"]
    
    // - MARK: Midde East
    let middleEasternCountries = ["AE", "SA", "IL"]
    let uaeCities = ["Dubai", "Abu Dhabi"]
    let saudiArabiaCities = ["Mecca", "Riyadh", "Jeddah"]
    let israelCities = ["Tel Aviv", "Jerusalem", "Haifa"]
    
    func makeSouthAmericanDictionary() -> [String:[String]] {
        for country in southAmericanCountries {
            switch country {
            case "BR":
                southAmerica[country] = brazilCities
            case "AR":
                southAmerica[country] = argentinaCities
            default:
                southAmerica[country] = chileCities
            }
        }
        return southAmerica
    }
    
    func makeOceaniaDictionary() -> [String:[String]] {
        for country in oceaniaCountries {
            switch country {
            case "AU":
                oceania[country] = australiaCities
            default:
                oceania[country] = newZealandCities
            }
        }
        return oceania
    }
    
    func makeMiddleEastDictionary() -> [String:[String]] {
        for country in middleEasternCountries {
            switch country {
            case "AE":
                middleEast[country] = uaeCities
            case "SA":
                middleEast[country] = saudiArabiaCities
            default:
                middleEast[country] = israelCities
            }
        }
        return middleEast
    }
    
    func makeAsianDictionary() -> [String:[String]] {
        for country in asianCountries {
            switch country {
            case "JP":
                asia[country] = japaneseCities
            case "CN":
                asia[country] = chineseCities
            case "IN":
                asia[country] = indianCities
            default:
                asia[country] = koreanCities
            }
        }
        return asia
    }
    
    func makeAfricanDictionary() -> [String:[String]] {
        for country in africanCountries {
            switch country {
            case "ZA":
                africa[country] = southAfricanCities
            case "KE":
                africa[country] = kenyanCities
            default:
                africa[country] = egyptianCities
            }
        }
        return africa
    }
    
    func makeCentralAmericanDictionary() -> [String:[String]] {
        for country in centralAmericanCountries {
            switch country {
            case "GT":
                centralAmerica[country] = guatemalaCities
            case "PA":
                centralAmerica[country] = panamaCities
            default:
                centralAmerica[country] = belizeCities
            }
        }
        return centralAmerica
    }
    
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
    
    func makeEuropeDictionary() -> [String:[String]] {
        for country in europeanCountries {
            switch country {
            case "GB":
                europe[country] = britishCitiess
            case "DK":
                europe[country] = danishCities
            case "IT":
                europe[country] = italianCities
            case "FR":
                europe[country] = frenchCities
            case "DE":
                europe[country] = germanCities
            case "SE":
                europe[country] = swedishCities
            case "ES":
                europe[country] = spanishCities
            default:
                europe[country] = portugueseCities
            }
        }
        return europe
    }
    
    func makeComprehensiveDestinationsDictionary() -> [String: Any] {
        northAmerica = makeNorthAmericaDictionary()
        europe = makeEuropeDictionary()
        asia = makeAsianDictionary()
        africa = makeAfricanDictionary()
        centralAmerica = makeCentralAmericanDictionary()
        southAmerica = makeSouthAmericanDictionary()
        oceania = makeOceaniaDictionary()
        middleEast = makeMiddleEastDictionary()
        
        for region in regions {
            switch region {
            case "North America":
                comprehensiveDestinationsDictionary[region] = northAmerica
            case "Europe":
                comprehensiveDestinationsDictionary[region] = europe
            case "Asia":
                comprehensiveDestinationsDictionary[region] = asia
            case "Africa":
                comprehensiveDestinationsDictionary[region] = africa
            case "Central America":
                comprehensiveDestinationsDictionary[region] = centralAmerica
            case "South America":
                comprehensiveDestinationsDictionary[region] = southAmerica
            case "Oceania":
                comprehensiveDestinationsDictionary[region] = oceania
            default:
                comprehensiveDestinationsDictionary[region] = middleEast
            }
        }
        
        return comprehensiveDestinationsDictionary
    }
}
