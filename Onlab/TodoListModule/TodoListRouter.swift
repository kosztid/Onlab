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
    return ListItem(todo: todo)
  }
}
