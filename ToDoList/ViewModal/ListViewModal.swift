//
//  ListViewModal.swift
//  ToDoList
//
//  Created by Ankit Kumar Yadav on 30/07/24.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemKey : String = "item_list"
    
    init(){
        getItems()
    }
    func getItems(){
        
//        let newItems = [
//            ItemModel(title: "This is the first Item", isCompleted: false),
//            ItemModel(title: "This is the Second Item", isCompleted: true),
//            ItemModel(title: "This is the third Item", isCompleted: true)
//        ]
//        items.append(contentsOf: newItems)
        guard 
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
//        let index = item.title.firstIndex{(existingItem)-> Bool in
//            return existingItem.id == item.id
//        }
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
            
        }
    }
    
    func saveItems(){
        if let encoderData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encoderData,forKey: itemKey)
        }
    }
    
}
