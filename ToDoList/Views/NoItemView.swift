//
//  NoItemView.swift
//  ToDoList
//
//  Created by Ankit Kumar Yadav on 02/08/24.
//

import SwiftUI

struct NoItemView: View {
    @State var animate: Bool = false
    let SecondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView{
            VStack{
                Text("There's no item !")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                Text("Are you a productive Preson, click the Add Button to add a new item in your ToDo List" )
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(), label: {
                        Text("Add Something! 😊")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background( animate ? SecondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    })
                .padding(.horizontal,animate ? 30 : 50)
                .shadow(
                    color: animate ? SecondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                    x: 0,
                    y: animate ? 30 : 50
                )
                .scaleEffect(animate ? 1.1:1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth:400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation(){
        guard  !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView{
        NoItemView()
            .navigationTitle("Title")
    }
    
}
