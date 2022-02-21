//
//  TodoDetailPresenter.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 19..
//

import Foundation
import Combine
import SwiftUI

class TodoDetailPresenter: ObservableObject{
    private let interactor: TodoDetailInteractor
    let todo: Todo
    private var cancellables = Set<AnyCancellable>()
    @Published var name : String
    @Published var description : String
    @Published var date : Date
    @Published var isDone : Bool
    
    init(interactor: TodoDetailInteractor){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.interactor = interactor
        self.todo = interactor.todo
        
        self.name = todo.name
        self.description = todo.description
        self.date = dateFormatter.date(from: todo.date) ?? Date()
        self.isDone = todo.isDone
    }
    
    func makeDoneButton() -> some View {
        Button(){
            self.interactor.ToggleDone()
        } label: {
            Label("",systemImage: todo.isDone ? "checkmark.circle" : "circle")
                .foregroundColor(todo.isDone ? .green : .red)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
    
}
