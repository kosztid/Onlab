//
//  IconsListPresenter.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 19..
//

import Foundation
import Combine
import SwiftUI

class IconsListPresenter: ObservableObject{
    @Published var todos: [Todo] = []
    private let interactor: IconsListInteractor
    private var cancellables = Set<AnyCancellable>()
    private let router = IconsListRouter()
    
    init(interactor: IconsListInteractor) {
        self.interactor = interactor
        interactor.model.$todos
          .assign(to: \.todos, on: self)
          .store(in: &cancellables)
    }
    
    
    
    func deleteTodo(_ index: IndexSet) {
      interactor.deleteTodo(index)
    }
    
    func makeButtonForItemAdderView() -> some View {
        NavigationLink("Add", destination: router.makeAdderView(model: interactor.model))
    }
    
    
}
