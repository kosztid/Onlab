//
//  DataModel.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

final class DataModel: ObservableObject{
    let todoskey: String = "todoskey"
    @Published var isSignedIn = false
    @Published var count: Int = 0
    @Published var todos: [Todo] = [
    ]{
        didSet{
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
                if let snapshot = snapshot{
                    DispatchQueue.main.async {
                        self.todos = snapshot.documents.map { d in
                            return Todo(id: d.documentID, name: d["name"] as? String ?? "", description: d["description"]  as? String ?? "", date: d["date"]  as? String ?? "", isDone: d["isDone"]  as? Bool ?? false)
                        }
                    }
                    
                }
            }
            else {
                //error handling
            }
        }
    }
    func pushToDB(todo: Todo){
        let db = Firestore.firestore()
        db.collection("todos").addDocument(data: ["name":todo.name,"description":todo.description,"date":todo.date,"isDone":todo.isDone]){
            error in
            if error == nil {
                self.pullFromDB()
            }
            else {
                //error handling
            }
        }
    }
    func deleteTodo(todoToDelete: Todo){
        let db = Firestore.firestore()
        
        DispatchQueue.main.async {
            db.collection("todos").document(todoToDelete.id).delete { error in
                if error == nil {
                    self.todos.removeAll { todo in
                        return todo.id == todoToDelete.id
                    }
                }
                else {
                    //error handling
                }
                
            }
        }
        
    }
    func signIn(email: String, password: String){
        let auth = Auth.auth()
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
            self.isSignedIn = true
        }
    }
    
    func register(email: String, password: String){
        let auth = Auth.auth()
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
        }
        
    }
    
    func addItem(todo: Todo){
        todos.append(todo)
        pushToDB(todo: todo)
        self.count += 1
    }
    func ToggleDone(todo: Todo){
        /*if let tododx = self.todos.firstIndex(where: {$0 == todo}) {
            todos[tododx].isDone.toggle()
        }
         */
        let db = Firestore.firestore()
        DispatchQueue.main.async {
            db.collection("todos").document(todo.id).setData(["isDone": !todo.isDone], merge: true)
        }
        self.pullFromDB()
        
    }
    /*
    func loadTodos(){
        guard
            let todos = UserDefaults.standard.data(forKey: todoskey),
            let savedTodos = try? JSONDecoder().decode([Todo].self, from: todos)
        
        else { return }
        self.todos = savedTodos
    }
     
    */
    /*
    func saveTodos(){
        if let encodedTodos = try? JSONEncoder().encode(todos){
            UserDefaults.standard.set(encodedTodos, forKey: todoskey)
        }
    }
     */
    
}
