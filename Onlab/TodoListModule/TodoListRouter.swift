//
//  TodoListRouter.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import Foundation
import SwiftUI

class TodoListRouter {
    func makeDetailView(for todo: Todo, model: DataModel) -> some View {
        let presenter = TodoDetailPresenter(interactor: TodoDetailInteractor(todo: todo, model: model))
        return TodoDetailView(presenter: presenter)
    }
    
    func makeAdderView(model: DataModel) -> some View{
        let presenter = ItemAdderPresenter(interactor: ItemAdderInteractor(model: model))
        return ItemAdderView(showView: .constant(false), presenter: presenter)
    }

    
}

