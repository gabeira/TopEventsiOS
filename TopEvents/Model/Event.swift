//
//  Event.swift
//  TopEvents
//
//  Created by Gabriel Bernardo Pereira on 21/11/18.
//  Copyright © 2018 Gabriel Bernardo Pereira. All rights reserved.
//

import Foundation

struct Events: Decodable {
    let events: [Event]
}

struct Event: Decodable {
    let name: String
    let date: String
    let availableSeats: Int
    let price: Double
    let venue: String
    let labels: [String]
}
