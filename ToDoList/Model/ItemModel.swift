//
//  ItemModel.swift
//  ToDoList
//
//  Created by Ankit Kumar Yadav on 30/07/24.
//

import Foundation

struct ItemModel: Identifiable,Codable{
    var id : String
    let title:String
    let isCompleted : Bool
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompletion()-> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
