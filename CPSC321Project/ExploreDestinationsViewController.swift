//
//  SurveyViewController.swift
//  CPSC321Project
//
//  Created by Colson, Kellie Anne on 11/23/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class ExploreDestinationsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
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
        //isModernSwitch.isOn
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
