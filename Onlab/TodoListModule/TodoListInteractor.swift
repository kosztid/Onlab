//
//  TodoListInteractor.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import Foundation

class TodoListInteractor {
    let model: DataModel

    init (model: DataModel) {
      self.model = model
    }
    func signOut(){
        model.signOut()
    }
    func addNewTodo(todo: Todo) {
        model.addItem(todo: todo)
    }
    
    func toggleDone(todo: Todo){
        model.ToggleDone(todo: todo)
    }
    
    func deleteTodo(_ index: IndexSet) {
        //model.todos.remove(atOffsets: index)
          model.deleteTodo(todoToDelete: model.todos[index.first!])
    }

}
