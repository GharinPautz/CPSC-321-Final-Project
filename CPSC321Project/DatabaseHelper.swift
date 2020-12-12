//
//  DatabaseHelper.swift
//  CPSC321Project
//
//  Created by Gharin Pautz on 11/27/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import Foundation
import SQLite3

class DatabaseHelper {

    let directoryUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

    var path: String? {
      return directoryUrl?.appendingPathComponent("Travelr.sqlite").relativePath
    }
    
    var db: OpaquePointer?
    
    init() {
        db = openDatabase()
    }


    func openDatabase() -> OpaquePointer? {
        var db: OpaquePointer?
        if sqlite3_open(path, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(path)")
            return db
        } else {
            print("Unable to open database.")
            return nil
        }
    }
    
    func createAccountsTable() {
        let createAccountsTableString = """
        CREATE TABLE IF NOT EXISTS Account(
        username CHAR(255) PRIMARY KEY NOT NULL,
        password CHAR(20) NOT NULL,
        name CHAR(255) NOT NULL,
        city CHAR(255) NOT NULL,
        province CHAR(255) NOT NULL,
        address CHAR(255) NOT NULL,
        country CHAR(255) NOT NULL,
        zip_code INT NOT NULL);
        """
        
        var createTableStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, createAccountsTableString, -1, &createTableStatement, nil) == SQLITE_OK {
          
          if sqlite3_step(createTableStatement) == SQLITE_DONE {
            print("\nAccounts table created.")
          } else {
            print("\nAccounts table could not be created.")
          }
        } else {
          print("\nCREATE TABLE statement could not be prepared.")
        }
       
        sqlite3_finalize(createTableStatement)
    }

    func insertAccount(username: String, password: String, name: String, city: String, province: String, address: String, country: String, zipCode: Int) {
        print("Insert in databse helper called")
        
        let insertStatementString = "INSERT INTO Account (username, password, name, city, province, address, country, zip_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?);"
        
        var insertStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            let username: NSString = NSString(string: username)
            let password: NSString = NSString(string: password)
            let name: NSString = NSString(string: name)
            let city: NSString = NSString(string: city)
            let province: NSString = NSString(string: province)
            let address: NSString = NSString(string: address)
            let country: NSString = NSString(string: country)
            let zip_code: Int32 = Int32(zipCode)
        
            sqlite3_bind_text(insertStatement, 1, username.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, password.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, name.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, city.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, province.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, address.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 7, country.utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 8, zip_code)
       
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("\nSuccessfully inserted row.")
            } else {
                print("\nCould not insert row.")
            }
        } else {
            print("\nINSERT statement could not be prepared.")
        }
      
      sqlite3_finalize(insertStatement)
    }
    
    func createDestinationsTable() {
        let createDestinationsTableStr = """
        CREATE TABLE IF NOT EXISTS Destinations(
            city VARCHAR(15),
            country VARCHAR(15),
            region ENUM('Africa', 'Asia', 'Central America', 'Europe', 'Middle East', 'North America', 'Oceania', 'South America'),
            has_beaches BOOL,
            has_mountains BOOL,
            is_modern BOOL,
            is_historic BOOL,
            is_adventurous BOOL,
            is_relaxing BOOL,
            is_family_friendly BOOL,
            need_travel_companion BOOL,
            PRIMARY KEY (city, country)
            );
        """
        
        var createTableStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, createDestinationsTableStr, -1, &createTableStatement, nil) == SQLITE_OK {
          
          if sqlite3_step(createTableStatement) == SQLITE_DONE {
            print("\nDestinations table created.")
          } else {
            print("\nDestinations table could not be created.")
          }
        } else {
          print("\nCREATE TABLE statement could not be prepared.")
        }
       
        sqlite3_finalize(createTableStatement)
    }
    
    func insertDestination(city: String, country: String, region: String, has_beaches: Bool, has_mountains: Bool, is_modern: Bool, is_historic: Bool, is_adventurous: Bool, is_relaxing: Bool, is_family_friendly: Bool, need_travel_companion: Bool) {
        print("Insert in databse helper called")
        
        let insertStatementString = "INSERT INTO Destinations (city, country, region, has_beaches, has_mountains, is_modern, is_historic, is_adventurous, is_relaxing, is_family_friendly, need_travel_companion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
        
        var insertStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            let city: NSString = NSString(string: city)
            let country: NSString = NSString(string: country)
            let region: NSString = NSString(string: region)
            let hasBeaches: NSNumber = NSNumber(value: has_beaches)
            let hasMountains: NSNumber = NSNumber(value: has_mountains)
            let isModern: NSNumber = NSNumber(value: is_modern)
            let isHistoric: NSNumber = NSNumber(value: is_historic)
            let isAdventurous: NSNumber = NSNumber(value: is_adventurous)
            let isRelaxing: NSNumber = NSNumber(value: is_relaxing)
            let isFamilyFriendly: NSNumber = NSNumber(value: is_family_friendly)
            let needTravelCompanion: NSNumber = NSNumber(value: need_travel_companion)
            
            sqlite3_bind_text(insertStatement, 1, city.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, country.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, region.utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 4, Int32(truncating: hasBeaches))
            sqlite3_bind_int(insertStatement, 5, Int32(truncating: hasMountains))
            sqlite3_bind_int(insertStatement, 6, Int32(truncating: isModern))
            sqlite3_bind_int(insertStatement, 7, Int32(truncating: isHistoric))
            sqlite3_bind_int(insertStatement, 8, Int32(truncating: isAdventurous))
            sqlite3_bind_int(insertStatement, 9, Int32(truncating: isRelaxing))
            sqlite3_bind_int(insertStatement, 10, Int32(truncating: isFamilyFriendly))
            sqlite3_bind_int(insertStatement, 11, Int32(truncating: needTravelCompanion))


            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("\nSuccessfully inserted row.")
            } else {
                print("\nCould not insert row.")
            }
        } else {
            print("\nINSERT statement could not be prepared.")
        }
      
      sqlite3_finalize(insertStatement)
    }

    
    
    func createFeedbackSurveyTable() {
        let createFeedbackSurveyTableStr = """
        CREATE TABLE IF NOT EXISTS Feedback_Survey(
            survey_id INT AUTO_INCREMENT,
            destination_city VARCHAR(15) NOT NULL,
            destination_country VARCHAR(15) NOT NULL,
            rating FLOAT NOT NULL,
            review TEXT,
            PRIMARY KEY(survey_id),
            FOREIGN KEY(destination_city, destination_country) REFERENCES Destinations(city, country) ON DELETE CASCADE
        );
        """
        
        var createTableStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, createFeedbackSurveyTableStr, -1, &createTableStatement, nil) == SQLITE_OK {
          
          if sqlite3_step(createTableStatement) == SQLITE_DONE {
            print("\nFeedback Survey table created.")
          } else {
            print("\nFeedback Survey table could not be created.")
          }
        } else {
          print("\nCREATE TABLE statement could not be prepared.")
        }
       
        sqlite3_finalize(createTableStatement)
    }
    
    func insertFeedbackSurvey(destination_city: String, destination_country: String, rating: Float, review: String) {
        print("Insert in databse helper called")
        
        let insertStatementString = "INSERT INTO Feedback_Survey (destination_city, destination_country, rating, review) VALUES (?, ?, ?, ?);"
        
        var insertStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            //let surveyID: Int32 = Int32(survey_id)
            let city: NSString = NSString(string: destination_city)
            let country: NSString = NSString(string: destination_country)
            let rating: NSNumber = NSNumber(value: rating)
            let review: NSString = NSString(string: review)
        
            //sqlite3_bind_int(insertStatement, 1, surveyID)
            sqlite3_bind_text(insertStatement, 1, city.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, country.utf8String, -1, nil)
            sqlite3_bind_double(insertStatement, 3, Double(truncating: rating))
            sqlite3_bind_text(insertStatement, 4, review.utf8String, -1, nil)
  
       
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("\nSuccessfully inserted row.")
            } else {
                print("\nCould not insert row.")
            }
        } else {
            print("\nINSERT statement could not be prepared.")
        }
      
      sqlite3_finalize(insertStatement)
    }
    
}
