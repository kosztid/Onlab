//
//  IconsListView.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 19..
//

import SwiftUI

struct IconsListView: View {
    @ObservedObject var presenter: IconsListPresenter
    var body: some View {
        List{
            ForEach(presenter.todos, id:\.self){ todo in
                  IconItem(todo: todo,presenter: presenter)
                    .frame(height: 200)
            }
            .onDelete(perform: presenter.deleteTodo)
        }
        .navigationBarTitle("Teendők alkalmazás", displayMode: .inline )
        .navigationBarItems(trailing: presenter.makeButtonForItemAdderView())
    }
}

struct IconsListView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel()
        let interactor = IconsListInteractor(model: model)
        let presenter = IconsListPresenter(interactor: interactor)
        IconsListView(presenter: presenter)
            .environmentObject(DataModel())
    }
}
