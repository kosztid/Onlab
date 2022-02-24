//
//  DataModel.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth
import GoogleSignIn

final class DataModel: ObservableObject{
    let todoskey: String = "todoskey"
    let auth : Auth
    let storage : Storage
    @Published var isSignedIn = false
    @Published var count: Int = 0
    @Published var todos: [Todo] = [
    ]{
        didSet{
        }
    }
    init(){
        self.auth = Auth.auth()
        self.storage = Storage.storage()
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
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.isSignedIn = true
            }
            
        }
    }
    
    func twittersignIn(){
          // 1
          if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error)
            }
          } else {
            // 2
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            // 3
            let configuration = GIDConfiguration(clientID: clientID)
            
            // 4
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
            
            // 5
            GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
              authenticateUser(for: user, with: error)
            }
          }
        
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
      // 1
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      // 2
      guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
      
      let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
      
      // 3
      Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
        if let error = error {
          print(error.localizedDescription)
        } else {
          self.isSignedIn = true
        }
      }
    }
    
    func register(email: String, password: String){
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                print("error creating user")
                return
            }
        }
        
    }
    func signOut(){
        try?auth.signOut()
        DispatchQueue.main.async {
            self.isSignedIn = false
        }
    }
    
    func downloadImage(){
        let storageref = storage.reference().child("images/testphoto.png")
        storageref.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
            
          } else {
            //kép betöltése...AnimatedImage???
          }
        }
    }
    
    func addItem(todo: Todo){
        todos.append(todo)
        pushToDB(todo: todo)
        self.count += 1
    }
    func ToggleDone(todo: Todo){
        let db = Firestore.firestore()
        DispatchQueue.main.async {
            db.collection("todos").document(todo.id).setData(["isDone": !todo.isDone], merge: true)
        }
        self.pullFromDB()
        
    }
}
