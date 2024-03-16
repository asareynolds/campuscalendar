//
//  Item.swift
//  CampusCal
//
//  Created by Ryan Nair on 3/16/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
