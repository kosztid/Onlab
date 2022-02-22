//
//  ContentView.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: DataModel
    @State private var selection: Tab = .list
    enum Tab{
        case list
        case icons
    }
    
    var body: some View {
        if model.isSignedIn == false {
            LoginScreenView(presenter: LoginScreenPresenter(interactor: LoginScreenInteractor(model: model)))
        }
        else {
            TabView(selection: $selection){
               NavigationView {
                   VStack(spacing: 32) {
                       TodoListView(presenter:
                                       TodoListPresenter(interactor:
                                                           TodoListInteractor(model: model)))

                   }
               }
                   .tabItem { Label("List", systemImage: "list.bullet") }
                   .tag(Tab.list)
               
               NavigationView {
                   VStack(spacing: 32) {
                       IconsListView(presenter:
                                       IconsListPresenter(interactor:
                                                           IconsListInteractor(model: model)))

                   }
               }
                   .tabItem {
                       Label("Icons", systemImage: "list.bullet")
                   }
                   .tag(Tab.icons)
           }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
