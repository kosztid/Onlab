//
//  IconsListInteractor.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 19..
//

import Foundation

class IconsListInteractor{
    let model: DataModel

    init (model: DataModel) {
      self.model = model
    }
    
    func addNewTodo(todo: Todo) {
        model.addItem(todo: todo)
    }
    
    func toggleDone(todo: Todo){
        model.ToggleDone(todo: todo)
    }
    
    func deleteTodo(_ index: IndexSet) {
      model.todos.remove(atOffsets: index)
    }
}
