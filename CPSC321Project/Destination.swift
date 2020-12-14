//
//  Destination.swift
//  CPSC321Project
//
//  Created by Gharin Pautz on 12/13/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import Foundation

class Destination: CustomStringConvertible {
    var city: String
    var countryCode: String
    var region: String
    var hasBeaches: Int
    var hasMountains: Int
    var isModern: Int
    var isHistoric: Int
    var isAdventurous: Int
    var isRelaxing: Int
    var isFamilyFriendly: Int
    var needTravelCompanion: Int
    var cost: Int
    var numInOrder: Int?
    var description: String {
        let str = "Destination: (\(city), \(countryCode), \(region))"
        //, hasBeaches: \(hasBeaches), hasMountains: \(hasMountains), isModern: \(isModern), isHistoric: \(isHistoric), isAdventurous: \(isAdventurous), isRelaxing: \(isRelaxing), isFamilyFriendly: \(isFamilyFriendly), needCompanion: \(needTravelCompanion), avgCost: \(cost)"
        return str
    }
    
    init(city: String, countryCode: String, region: String, hasBeaches: Int, hasMountains: Int, isModern: Int, isHistoric: Int, isAdventurous: Int, isRelaxing: Int, isFamilyFriendly: Int, needTravelCompanion: Int, cost: Int) {
        self.city = city
        self.countryCode = countryCode
        self.region = region
        self.hasBeaches = hasBeaches
        self.hasMountains = hasMountains
        self.isModern = isModern
        self.isHistoric = isHistoric
        self.isAdventurous = isAdventurous
        self.isRelaxing = isRelaxing
        self.isFamilyFriendly = isFamilyFriendly
        self.needTravelCompanion = needTravelCompanion
        self.cost = cost
        numInOrder = nil
    }
}
