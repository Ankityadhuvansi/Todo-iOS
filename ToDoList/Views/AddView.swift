//
//  AddView.swift
//  ToDoList
//
//  Created by Ankit Kumar Yadav on 29/07/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModal:ListViewModel
    @State var textFieldText : String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type Something here...",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                Button(action: saveButtonPresssed, label: {
                    Text("save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                Text("Developed by Ankit♥️")
                                .font(.footnote)
                                .padding()
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPresssed(){
        if isTextIsAppropiate(){
            listViewModal.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func isTextIsAppropiate()-> Bool{
        if textFieldText.count < 5{
            alertTitle = "Your new item must be 5 character long or more 🙁"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert()-> Alert{
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_preview: PreviewProvider{
    static var previews: some View{
        NavigationView{
           AddView()
        }
        .environmentObject(ListViewModel())
    }
}
#Preview {
    NavigationView{
        AddView()
    }
}
