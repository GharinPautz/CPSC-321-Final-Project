//
//  DestinationTableViewController.swift
//  CPSC321Project
//
//  Created by Gharin Pautz on 11/23/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class DestinationTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var destinations = [Destination]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
