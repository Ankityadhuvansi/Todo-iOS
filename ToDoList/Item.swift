//
//  Item.swift
//  ToDoList
//
//  Created by Ankit Kumar Yadav on 29/07/24.
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
