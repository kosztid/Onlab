//
//  ListItem.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import SwiftUI

struct ListItem: View {
    var todo: Todo
    @ObservedObject var presenter: TodoListPresenter

    var body: some View {
        HStack{
            Text(todo.name)
                .font(.system(size: 20))
            Spacer()
            
                Button(){
                    self.presenter.toggleDone(todo: todo)
                } label: {
                    Label("",systemImage: todo.isDone ? "checkmark.circle" : "circle")
                        .foregroundColor(todo.isDone ? .green : .red)
                }
                .buttonStyle(BorderlessButtonStyle())
                
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(todo: Todo(name: "peldanev", description: "desc", date: Date()),presenter: TodoListPresenter(interactor: TodoListInteractor(model: DataModel())))
            .previewLayout(.fixed(width: 300, height: 40))
            .environmentObject(DataModel())
    }
}
