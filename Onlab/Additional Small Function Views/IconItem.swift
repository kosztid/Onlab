//
//  IconItem.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 19..
//

import SwiftUI

struct IconItem: View {
    @State var date = Date()
    var todo: Todo
    @ObservedObject var presenter: IconsListPresenter
    var body: some View {
        VStack{
            HStack{
                Text(todo.name)
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    Button(){
                        self.presenter.toggleDone(todo: todo)
                    } label: {
                        Label("",systemImage: todo.isDone ? "checkmark.circle" : "circle")
                            .foregroundColor(todo.isDone ? .green : .red)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            Text(todo.date, style: .date)
                .fontWeight(.bold)
                .italic()
                .foregroundColor(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(todo.description)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(5)
    }
}

struct IconItem_Previews: PreviewProvider {
    static var previews: some View {
        IconItem(todo: Todo(name: "peldanev", description: "desc",date: Date()),presenter: IconsListPresenter(interactor: IconsListInteractor(model: DataModel())))
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
