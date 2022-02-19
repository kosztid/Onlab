//
//  ListItem.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import SwiftUI

struct ListItem: View {
    var todo: Todo
    @EnvironmentObject var modelData: DataModel
    
    var tododx: Int {
        modelData.todos.firstIndex(where:{ $0 == todo}) ?? 0
    }
    var body: some View {
        HStack{
            Text(todo.name)
                .font(.system(size: 20))
            Spacer()
            
            if modelData.todos.count != 0 {
            DoneButton(isSet: $modelData.todos[tododx].isDone)
                .font(.system(size: 15))
                
            }
            
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(todo: Todo(name: "peldanev", description: "desc", date: Date()))
            .previewLayout(.fixed(width: 300, height: 40))
            .environmentObject(DataModel())
    }
}
