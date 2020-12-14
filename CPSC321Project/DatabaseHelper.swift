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
            print("Successfully opened connection to database at \(String(describing: path))")
            return db
        } else {
            print("Unable to open database.")
            return nil
        }
    }
    
    func createAccountsTable() {
        let createAccountsTableString = """
        CREATE TABLE IF NOT EXISTS Account(
        username TEXT PRIMARY KEY NOT NULL,
        password TEXT NOT NULL,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL,
        address TEXT NOT NULL,
        city TEXT NOT NULL,
        country_code TEXT NOT NULL,
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

    func insertAccount(username: String, password: String, firstName: String, lastName: String, address: String, city: String, countryCode: String, zipCode: Int) {
        print("Insert in databse helper called")
        
        let insertStatementString = "INSERT INTO Account (username, password, first_name, last_name, address, city, country_code, zip_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?);"
        
        var insertStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            let username: NSString = NSString(string: username)
            let password: NSString = NSString(string: password)
            let first_name: NSString = NSString(string: firstName)
            let last_name: NSString = NSString(string: lastName)
            let address: NSString = NSString(string: address)
            let city: NSString = NSString(string: city)
            let country_code: NSString = NSString(string: countryCode)
            let zip_code: NSNumber = NSNumber(value: zipCode)
        
            sqlite3_bind_text(insertStatement, 1, username.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, password.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, first_name.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, last_name.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, address.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, city.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 7, country_code.utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 8, Int32(truncating: zip_code))
       
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
            city TEXT NOT NULL,
            country_code TEXT NOT NULL,
            region TEXT NOT NULL,
            has_beaches INTEGER NOT NULL,
            has_mountains INTEGER NOT NULL,
            is_modern INTEGER NOT NULL,
            is_historic INTEGER NOT NULL,
            is_adventurous INTEGER NOT NULL,
            is_relaxing INTEGER NOT NULL,
            is_family_friendly INTEGER NOT NULL,
            need_travel_companion INTEGER NOT NULL,
            avg_cost INTEGER NOT NULL,
            PRIMARY KEY (city, country_code)
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
    
    func insertDestination(city: String, country_code: String, region: String, has_beaches: Int, has_mountains: Int, is_modern: Int, is_historic: Int, is_adventurous: Int, is_relaxing: Int, is_family_friendly: Int, need_travel_companion: Int, avg_cost: Int) {
        print("Insert in databse helper called")
        
        let insertStatementString = "INSERT INTO Destinations VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
        
        var insertStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            let city: NSString = NSString(string: city)
            let countryCode: NSString = NSString(string: country_code)
            let region: NSString = NSString(string: region)
            let hasBeaches: NSNumber = NSNumber(value: has_beaches)
            let hasMountains: NSNumber = NSNumber(value: has_mountains)
            let isModern: NSNumber = NSNumber(value: is_modern)
            let isHistoric: NSNumber = NSNumber(value: is_historic)
            let isAdventurous: NSNumber = NSNumber(value: is_adventurous)
            let isRelaxing: NSNumber = NSNumber(value: is_relaxing)
            let isFamilyFriendly: NSNumber = NSNumber(value: is_family_friendly)
            let needTravelCompanion: NSNumber = NSNumber(value: need_travel_companion)
            let avgCost: NSNumber = NSNumber(value: avg_cost)
            
            sqlite3_bind_text(insertStatement, 1, city.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, countryCode.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, region.utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 4, Int32(truncating: hasBeaches))
            sqlite3_bind_int(insertStatement, 5, Int32(truncating: hasMountains))
            sqlite3_bind_int(insertStatement, 6, Int32(truncating: isModern))
            sqlite3_bind_int(insertStatement, 7, Int32(truncating: isHistoric))
            sqlite3_bind_int(insertStatement, 8, Int32(truncating: isAdventurous))
            sqlite3_bind_int(insertStatement, 9, Int32(truncating: isRelaxing))
            sqlite3_bind_int(insertStatement, 10, Int32(truncating: isFamilyFriendly))
            sqlite3_bind_int(insertStatement, 11, Int32(truncating: needTravelCompanion))
            sqlite3_bind_int(insertStatement, 12, Int32(truncating: avgCost))


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

    func createCountryTable() {
        let createCountryTableStr = """
        CREATE TABLE Country(
            country_code TEXT PRIMARY KEY NOT NULL,
            country_name TEXT NOT NULL,
            FOREIGN KEY(country_code) REFERENCES Destinations(country_code) ON DELETE CASCADE);
        """
        var createTableStatement: OpaquePointer?
         
         if sqlite3_prepare_v2(db, createCountryTableStr, -1, &createTableStatement, nil) == SQLITE_OK {
           
           if sqlite3_step(createTableStatement) == SQLITE_DONE {
             print("\nCountry table created.")
           } else {
             print("\nCountry table could not be created.")
           }
         } else {
           print("\nCREATE TABLE statement could not be prepared.")
         }
        
         sqlite3_finalize(createTableStatement)
    }
    
    func insertCountry(countryCode: String, countryName: String) {
        print("Insert in databse helper called")
        
        let insertStatementString = "INSERT INTO Country VALUES (?, ?);"
        
        var insertStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            let city: NSString = NSString(string: countryCode)
            let countryCode: NSString = NSString(string: countryName)
            
            sqlite3_bind_text(insertStatement, 1, city.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, countryCode.utf8String, -1, nil)

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

    
    func createReviewsTable() {
        let createReviewsTableStr = """
        CREATE TABLE IF NOT EXISTS Review(
            survey_id INTEGER PRIMARY KEY AUTOINCREMENT,
            destination_city TEXT NOT NULL,
            destination_country_code TEXT NOT NULL,
            rating REAL NOT NULL,
            review TEXT NOT NULL,
            FOREIGN KEY(destination_city, destination_country_code) REFERENCES Destinations(city, country_code) ON DELETE CASCADE
        );
        """
        
        var createTableStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, createReviewsTableStr, -1, &createTableStatement, nil) == SQLITE_OK {
          
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
    
    func insertReview(destination_city: String, destination_country_code: String, rating: Int, review: String) {
        print("Insert in databse helper called")
        
        let insertStatementString = "INSERT INTO Review (survey_id, destination_city, destination_country_code, rating, review) VALUES (null, ?, ?, ?, ?);"
        
        var insertStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            //let surveyID: Int32 = Int32(survey_id)
            let city: NSString = NSString(string: destination_city)
            let country: NSString = NSString(string: destination_country_code)
            let rating: NSNumber = NSNumber(value: rating)
            let review: NSString = NSString(string: review)
        
            //sqlite3_bind_int(insertStatement, 1, surveyID)
            sqlite3_bind_text(insertStatement, 1, city.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, country.utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 3, Int32(truncating: rating))
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
    
    // Use this for whenever you want to drop a table... just change string
    func dropDestinationsTable() {
        let dropTableString = """
        DROP TABLE Destinations;
        """
        
        var createTableStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, dropTableString, -1, &createTableStatement, nil) == SQLITE_OK {
          
          if sqlite3_step(createTableStatement) == SQLITE_DONE {
            print("\nDropped table successfuly")
          } else {
            print("\nCould not drop table.")
          }
        } else {
          print("\nDROP TABLE statement could not be prepared.")
        }
       
        sqlite3_finalize(createTableStatement)
    }
    
    func dropAccountTable() {
        let dropTableString = """
        DROP TABLE Account;
        """
        
        var createTableStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, dropTableString, -1, &createTableStatement, nil) == SQLITE_OK {
          
          if sqlite3_step(createTableStatement) == SQLITE_DONE {
            print("\nDropped table successfuly")
          } else {
            print("\nCould not drop table.")
          }
        } else {
          print("\nDROP TABLE statement could not be prepared.")
        }
       
        sqlite3_finalize(createTableStatement)
    }
    
    func dropReviewsTable() {
        let dropTableString = """
        DROP TABLE Review;
        """
        
        var createTableStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, dropTableString, -1, &createTableStatement, nil) == SQLITE_OK {
          
          if sqlite3_step(createTableStatement) == SQLITE_DONE {
            print("\nDropped table successfuly")
          } else {
            print("\nCould not drop table.")
          }
        } else {
          print("\nDROP TABLE statement could not be prepared.")
        }
       
        sqlite3_finalize(createTableStatement)
    }
    
    
    func existsQuery(withQuery queryStr: String) -> Bool{
      var queryStatement: OpaquePointer?
    
      if sqlite3_prepare_v2(db, queryStr, -1, &queryStatement, nil) ==
          SQLITE_OK {
        
          if sqlite3_step(queryStatement) == SQLITE_ROW {
            return true
          } else {
              print("\nQuery returned no results.")
              return false
          }
      } else {
          // 6
        let errorMessage = String(cString: sqlite3_errmsg(db))
        print("\nQuery is not prepared \(errorMessage)")
        return false
      }
      // 7
      sqlite3_finalize(queryStatement)
    }
    
    func getAllCountryCodes() -> [String]{
        var queryStatement: OpaquePointer?
        var resultsArray: [String] = [String]()
        
        let queryStr = "SELECT DISTINCT country_code FROM Destinations ORDER BY country_code"
        
        if sqlite3_prepare_v2(db, queryStr, -1, &queryStatement, nil) == SQLITE_OK {
            while (sqlite3_step(queryStatement) == SQLITE_ROW) {
                if let countryCodeResult = sqlite3_column_text(queryStatement, 0){
                    let countryCode = String(cString: countryCodeResult)
                    resultsArray.append(countryCode)
                }
            }
          } else {
              let errorMessage = String(cString: sqlite3_errmsg(db))
              print("\nQuery is not prepared \(errorMessage)")
          }
          sqlite3_finalize(queryStatement)
        return resultsArray
    }
    
    func getAllCities() -> [String]{
        var queryStatement: OpaquePointer?
        var resultsArray: [String] = [String]()
        
        let queryStr = "SELECT DISTINCT city FROM Destinations"
        
        if sqlite3_prepare_v2(db, queryStr, -1, &queryStatement, nil) == SQLITE_OK {
            while (sqlite3_step(queryStatement) == SQLITE_ROW) {
                if let countryCodeResult = sqlite3_column_text(queryStatement, 0){
                    let countryCode = String(cString: countryCodeResult)
                    resultsArray.append(countryCode)
                }
            }
          } else {
              let errorMessage = String(cString: sqlite3_errmsg(db))
              print("\nQuery is not prepared \(errorMessage)")
          }
          sqlite3_finalize(queryStatement)
        return resultsArray
    }

    func findDestionations(fromQuery queryStr: String) -> [Destination]? {
        var queryStatement: OpaquePointer?
        var resultSet = [Destination]()

        if sqlite3_prepare_v2(db, queryStr, -1, &queryStatement, nil) ==
            SQLITE_OK {
            
          while sqlite3_step(queryStatement) == SQLITE_ROW {
            
            guard let queryResultCol1 = sqlite3_column_text(queryStatement, 0), let queryResultCol2 = sqlite3_column_text(queryStatement, 1), let queryResultCol3 = sqlite3_column_text(queryStatement, 2) else {
              print("Query result is nil")
              return nil
            }
            let city = String(cString: queryResultCol1)
            let countryCode = String(cString: queryResultCol2)
            let region = String(cString: queryResultCol3)
            let hasBeaches = sqlite3_column_int(queryStatement, 3)
            let hasMountains = sqlite3_column_int(queryStatement, 4)
            let isModern = sqlite3_column_int(queryStatement, 5)
            let isHistoric = sqlite3_column_int(queryStatement, 6)
            let isAdventurous = sqlite3_column_int(queryStatement, 7)
            let isRelaxing = sqlite3_column_int(queryStatement, 8)
            let isFamilyFriendly = sqlite3_column_int(queryStatement, 9)
            let needTravelCompanion = sqlite3_column_int(queryStatement, 10)
            let avgCost = sqlite3_column_int(queryStatement, 11)
            
            print("\nQuery Result:")
            print("\(city) | \(countryCode) | \(region) | \(hasBeaches) | \(hasMountains) | \(isModern) | \(isHistoric) | \(isAdventurous) | \(isRelaxing) | \(isFamilyFriendly) | \(needTravelCompanion) | \(avgCost)")
            resultSet.append(Destination(city: city, countryCode: countryCode, region: region, hasBeaches: Int(hasBeaches), hasMountains: Int(hasMountains), isModern: Int(isModern), isHistoric: Int(isHistoric), isAdventurous: Int(isAdventurous), isRelaxing: Int(isRelaxing), isFamilyFriendly: Int(isFamilyFriendly), needTravelCompanion: Int(needTravelCompanion), cost: Int(avgCost)))
        }
        }
        else {
            
          let errorMessage = String(cString: sqlite3_errmsg(db))
          print("\nQuery is not prepared \(errorMessage)")
        }
        
        sqlite3_finalize(queryStatement)
        return resultSet
    }
    
    func findReviews(fromQuery queryStr: String) -> [Review]? {
        var queryStatement: OpaquePointer?
        var resultSet = [Review]()

        if sqlite3_prepare_v2(db, queryStr, -1, &queryStatement, nil) ==
            SQLITE_OK {
            
          while sqlite3_step(queryStatement) == SQLITE_ROW {
            
            guard let queryResultCol1 = sqlite3_column_text(queryStatement, 0), let queryResultCol2 = sqlite3_column_text(queryStatement, 1), let queryResultCol3 = sqlite3_column_text(queryStatement, 2) else {
              print("Query result is nil")
              return nil
            }
            
            // c.country_name, d.city, r.review
            let countryName = String(cString: queryResultCol1)
            let city = String(cString: queryResultCol2)
            let review = String(cString: queryResultCol3)
            let rating = sqlite3_column_int(queryStatement, 3)
            
            print("\nQuery Result:")
            print("\(countryName) | \(city) | \(review) | \(rating)")
            
            resultSet.append(Review(city: city, country: countryName, message: review, rating: Int(rating)))
        }
        }
        else {
            
          let errorMessage = String(cString: sqlite3_errmsg(db))
          print("\nQuery is not prepared \(errorMessage)")
        }
        
        sqlite3_finalize(queryStatement)
        return resultSet
    }
    
    func getAverageRating(queryStr: String) -> Float? {
       var queryStatement: OpaquePointer?
       
       if sqlite3_prepare_v2(db, queryStr, -1, &queryStatement, nil) ==
           SQLITE_OK {
         
         if sqlite3_step(queryStatement) == SQLITE_ROW {
           
           let avgRating = Float(sqlite3_column_double(queryStatement, 0))
           
           print(avgRating)
            return avgRating
       } else {
           print("\nQuery returned no results.")
       }
       } else {
           // 6
         let errorMessage = String(cString: sqlite3_errmsg(db))
         print("\nQuery is not prepared \(errorMessage)")
       }
       // 7
       sqlite3_finalize(queryStatement)
        return nil
    }
}
