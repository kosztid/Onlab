//
//  TodoListInteractor.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 19..
//

import Foundation

class TodoDetailInteractor{
    let todo: Todo
    let model: DataModel
    
    init(todo: Todo, model: DataModel){
        self.todo = todo
        self.model = model
    }
    func ToggleDone(){
        model.ToggleDone(todo: todo)
    }
}
