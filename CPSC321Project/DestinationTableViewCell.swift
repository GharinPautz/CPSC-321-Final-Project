//
//  DestinationTableViewCell.swift
//  CPSC321Project
//
//  Created by Gharin Pautz on 11/23/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class DestinationTableViewCell: UITableViewCell {
    
    @IBOutlet var destinationNumberLabel: UILabel!
    @IBOutlet var destinationNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with destination: Destination) {
        destinationNumberLabel.text = "1"
        destinationNameLabel.text = "\(destination.city), \(destination.countryCode)"
    }
}
