//
//  DataModel.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import Foundation

import Foundation
import SwiftUI

final class DataModel: ObservableObject{
    let todoskey: String = "todoskey"
    @Published var count: Int = 0
    @Published var todos: [Todo] = [
    ]{
        didSet{
            saveTodos()
        }
    }
    init(){
        loadTodos()
        self.count = todos.count
        if todos.count == 0 {
            todos.append(Todo(dx: 0, name: "Teszter", description: "Tesztd", date: Date(), isDone: true))
        }
    }
    func deleteRow(at indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
        }
    
    func addItem(todo: Todo){
        todos.append(todo)
        self.count += 1
    }
    
    func loadTodos(){
        guard
            let todos = UserDefaults.standard.data(forKey: todoskey),
            let savedTodos = try? JSONDecoder().decode([Todo].self, from: todos)
        
        else { return }
        self.todos = savedTodos
    }
    func saveTodos(){
        if let encodedTodos = try? JSONEncoder().encode(todos){
            UserDefaults.standard.set(encodedTodos, forKey: todoskey)
        }
    }
}
