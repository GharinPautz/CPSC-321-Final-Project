//
//  SurveyViewController.swift
//  CPSC321Project
//
//  Created by Colson, Kellie Anne on 11/23/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class ExploreDestinationsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var destinations: [Destination]? = nil
    
    var dbHelper: DatabaseHelper? = nil
    
    var pickerData: [String] = ["Africa", "Asia", "Central America", "Europe", "Middle East", "North America", "Oceania", "South America"]
    
    @IBOutlet var regionPicker: UIPickerView!
    @IBOutlet var isModernSwitch: UISwitch!
    @IBOutlet var isHistoricSwitch: UISwitch!
    @IBOutlet var isBeachySwitch: UISwitch!
    @IBOutlet var isMountainousSwitch: UISwitch!
    @IBOutlet var isAdventurousSwitch: UISwitch!
    @IBOutlet var isRelaxingSwitch: UISwitch!
    @IBOutlet var isFamilyFriendlySwitch: UISwitch!
    @IBOutlet var hasTravelCompanionSwitch: UISwitch!
    @IBOutlet var costDisplayLabel: UILabel!
    @IBOutlet var costStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.regionPicker.delegate = self
        self.regionPicker.dataSource = self
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    @IBAction func findDestinationButtonPressed(_ sender: UIButton) {
        print("Find destination button pressed")
        // call the query function
        var hasBeachesStr = "", hasMountainsStr = "", isModernStr = "", isHistoricStr = "", isAdventurousStr = "", isRelaxingStr = "", isFamilyFriendlyStr = "", needTravelCompanionStr = ""
        
        var attributeArray = [String]()
        
        let region = pickerData[regionPicker.selectedRow(inComponent: 0)]

        if isBeachySwitch.isOn {
            let hasBeaches = NSNumber(value: isBeachySwitch.isOn)
            hasBeachesStr = " AND has_beaches = \(hasBeaches)"
            attributeArray.append(hasBeachesStr)
        }
        if isMountainousSwitch.isOn {
            let hasMountains = NSNumber(value: isMountainousSwitch.isOn)
            hasMountainsStr = " AND has_mountains = \(hasMountains)"
            attributeArray.append(hasMountainsStr)
        }
        if isModernSwitch.isOn {
            let isModern = NSNumber(value: isModernSwitch.isOn)
            isModernStr = " AND is_modern = \(isModern)"
            attributeArray.append(isModernStr)
        }
        if isHistoricSwitch.isOn {
            let isHistoric = NSNumber(value: isHistoricSwitch.isOn)
            isHistoricStr = " AND is_historic = \(isHistoric)"
            attributeArray.append(isHistoricStr)
        }
        if isAdventurousSwitch.isOn {
            let isAdventurous = NSNumber(value: isAdventurousSwitch.isOn)
            isAdventurousStr = " AND is_adventurous = \(isAdventurous)"
            attributeArray.append(isAdventurousStr)
        }
        if isRelaxingSwitch.isOn {
            let isRelaxing = NSNumber(value: isRelaxingSwitch.isOn)
            isRelaxingStr = " AND is_relaxing = \(isRelaxing)"
            attributeArray.append(isRelaxingStr)
        }
        if isFamilyFriendlySwitch.isOn {
            let isFamilyFriendly = NSNumber(value: isFamilyFriendlySwitch.isOn)
            isFamilyFriendlyStr = " AND is_family_friendly = \(isFamilyFriendly)"
            attributeArray.append(isFamilyFriendlyStr)
        }
        if hasTravelCompanionSwitch.isOn {
            let needTravelCompanion = NSNumber(value: hasTravelCompanionSwitch.isOn)
            needTravelCompanionStr = " AND need_travel_companion = \(needTravelCompanion)"
            attributeArray.append(needTravelCompanionStr)
        }
    
        
        //let cost = costStepper.value
        
        var queryStr = "SELECT * FROM Destinations WHERE region = '\(region)'"
        for attribute in attributeArray {
            queryStr += attribute
        }
        queryStr += " ORDER BY avg_cost DESC"
        
        print(queryStr)
    
        destinations = dbHelper?.findDestionations(fromQuery: queryStr)
        print(destinations)
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
