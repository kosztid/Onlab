//
//  TodoListView.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var presenter: TodoListPresenter
    var body: some View {
        List{
            ForEach(presenter.todos, id:\.self){ todo in
                self.presenter.linkBuilder(for: todo) {
                  ListItem(todo: todo)
                    .frame(height: 200)
                }
            }
            .onDelete(perform: presenter.deleteTodo)
        }
        .navigationBarTitle("Teendők alkalmazás", displayMode: .inline )
        .navigationBarItems(trailing: presenter.makeAddNewButton())
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel()
        let interactor = TodoListInteractor(model: model)
        let presenter = TodoListPresenter(interactor: interactor)
        TodoListView(presenter: presenter)
            .environmentObject(DataModel())
    }
}
