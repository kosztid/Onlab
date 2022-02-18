//
//  ContentView.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var model: DataModel

  var body: some View {
    NavigationView {
      VStack(spacing: 32) {
          TodoListView(presenter:
            TodoListPresenter(interactor:
              TodoListInteractor(model: model)))

      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
