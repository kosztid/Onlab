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
    private let router = TodoListRouter()
    
    init(interactor: TodoListInteractor) {
        self.interactor = interactor
        interactor.model.$todos
          .assign(to: \.todos, on: self)
          .store(in: &cancellables)
    }
    
    func deleteTodo(_ index: IndexSet) {
      interactor.deleteTodo(index)
    }
    
    func linkBuilder<Content: View>(
        for todo: Todo,
        @ViewBuilder content: () -> Content
      ) -> some View {
        NavigationLink(
          destination: router.makeDetailView(
            for: todo,
            model: interactor.model)) {
              content()
        }
    }
    
    func makeAddNewButton() -> some View {
        Button{} label: {
            Text("Add")
        }
    }
}
