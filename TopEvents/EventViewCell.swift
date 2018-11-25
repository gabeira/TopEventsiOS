//
//  EventViewCell.swift
//  TopEvents
//
//  Created by Gabriel Bernardo Pereira on 21/11/18.
//  Copyright © 2018 Gabriel Bernardo Pereira. All rights reserved.
//

import UIKit

class EventViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var labelsLabel: UILabel!
    
    func setEvent(event: Event){
        nameLabel?.text = event.name
        priceLabel?.text = "$\(event.price)"
        seatsLabel.text = "\(event.availableSeats) seats available"
        venueLabel?.text = event.venue
        labelsLabel?.text = event.labels.joined(separator: ", ").capitalized

        //Converting the date string to readable format
        let date = event.date.parseISODate()
        dateLabel?.text  =  date?.toString()
        
        if (event.labels.contains("play")){
            labelsLabel?.textColor = UIColor(red: 0.00, green: 1.00, blue: 0.00, alpha: 1.00)
        }
    }
}
