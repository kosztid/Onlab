//
//  TodoDetailView.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 19..
//

import SwiftUI

struct TodoDetailView: View {
    @ObservedObject var presenter: TodoDetailPresenter
    
    var body: some View {
        VStack {
            
            HStack {
                Text(presenter.name)
                    .font(.system(size: 45))
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                presenter.makeDoneButton()
                }
                
            .offset(y: 20)
            VStack {
                Text(presenter.date, style: .date)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Leírás")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                Text(presenter.description)
                    .font(.system(size: 20))
                    .italic()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.offset(y:20)
        
            Spacer()
        }
        .padding(20)
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = TodoDetailInteractor(todo: Todo(id: "asda", name: "Teszttodo", description: "leiras", date: "02/02/2022", isDone: true), model: DataModel())
        let presenter = TodoDetailPresenter(interactor: interactor)
        TodoDetailView(presenter: presenter)
            .environmentObject(DataModel())
    }
}
