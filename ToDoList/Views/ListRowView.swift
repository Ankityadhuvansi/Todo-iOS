//
//  ListRowView.swift
//  ToDoList
//
//  Created by Ankit Kumar Yadav on 29/07/24.
//

import SwiftUI

struct ListRowView: View {
    
    let Item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: Item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(Item.isCompleted ? .green : .red)
            Text(Item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

struct ListView_Preview: PreviewProvider{
    
    static var item1 = ItemModel(title: "First Item", isCompleted: false)
    static var item2 = ItemModel(title: "Second Item", isCompleted: true)

    static var previews: some View{
        Group{
            ListRowView(Item: item1)
            ListRowView(Item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}

//#Preview {
//    ListRowView(title: "This the first title")
//}
