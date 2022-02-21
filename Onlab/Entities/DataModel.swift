//
//  DataModel.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import Foundation
import SwiftUI
import FirebaseFirestore

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
        pullFromDB()
        self.count = todos.count
    }
    
    func pullFromDB(){
        let db = Firestore.firestore()
        db.collection("todos").getDocuments { snapshot, error in
            if error == nil {
                //no error
                if let snapshot = snapshot{
                    DispatchQueue.main.async {
                        self.todos = snapshot.documents.map { d in
                            return Todo(name: d["name"] as? String ?? "", description: d["description"]  as? String ?? "", date: d["date"]  as? String ?? "", isDone: d["isDone"]  as? Bool ?? false)
                        }
                    }
                    
                }
            }
            else {
                //error handling
            }
        }
    }
    func deleteRow(at indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
        }
    
    func addItem(todo: Todo){
        todos.append(todo)
        self.count += 1
    }
    func ToggleDone(todo: Todo){
        if let tododx = self.todos.firstIndex(where: {$0 == todo}) {
            todos[tododx].isDone.toggle()
        }
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
