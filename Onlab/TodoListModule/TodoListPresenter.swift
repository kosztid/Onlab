//
//  TodoListPresenter.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import Foundation
import Combine
import SwiftUI

class TodoListPresenter: ObservableObject{
    @Published var todos: [Todo] = []
    private let interactor: TodoListInteractor
    private var cancellables = Set<AnyCancellable>()
    
    init(interactor: TodoListInteractor) {
        self.interactor = interactor
        interactor.model.$todos
          .assign(to: \.todos, on: self)
          .store(in: &cancellables)
    }
    
    func makeAddNewButton() -> some View {
        Button{} label: {
            Text("Add")
        }
    }
}
