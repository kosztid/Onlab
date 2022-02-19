//
//  ItemAdderInteractor.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 19..
//

import Foundation

class ItemAdderInteractor{
    let model: DataModel
    
    init(model: DataModel){
        self.model = model
    }
    func addItem(todo: Todo){
        model.addItem(todo: todo)
    }
}
