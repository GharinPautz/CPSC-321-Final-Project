//
//  DestinationTableViewController.swift
//  CPSC321Project
//
//  Created by Gharin Pautz on 11/23/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class DestinationTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var destinations = [Destination]()
    var dbHelper: DatabaseHelper? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateNumbers(in: destinations)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return destinations.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let place = destinations[row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DestinationCell", for: indexPath) as! DestinationTableViewCell
        
        cell.update(with: place)
        return cell
    }
    
    func updateNumbers(in destinations: [Destination]) {
        for i in 0..<destinations.count {
            destinations[i].numInOrder = i + 1
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // make a prepare for to send Destination and DatabaseHelper
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identier = segue.identifier {
            if identier == "DetailSegue" {
                
                if let destinationDetailVC = segue.destination as? DestinationDetailViewController {
                    if let indexPath = tableView.indexPathForSelectedRow {
                        let destination = destinations[indexPath.row]
                        destinationDetailVC.destination = destination
                        // get DatabaseHelper reference
                        destinationDetailVC.dbHelper = dbHelper
                    }
                }
            }
        }
    }
}
