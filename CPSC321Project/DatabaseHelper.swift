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
        CREATE TABLE Account(
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
}
