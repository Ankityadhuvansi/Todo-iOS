//
//  ListView.swift
//  ToDoList
//
//  Created by Ankit Kumar Yadav on 29/07/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        VStack {
            ZStack{
                if listViewModel.items.isEmpty{
                    NoItemView()
                        .transition(AnyTransition.opacity
                            .animation(.easeIn)
                        )
                }else{
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(Item: item)
                                .onTapGesture {
                                    withAnimation(.linear){
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("ToDo List 📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("Add", destination: AddView())
        )
            Text("Developed by Ankit♥️")
                            .font(.footnote)
                            .padding()
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


