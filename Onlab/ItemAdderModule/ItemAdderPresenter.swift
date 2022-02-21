//
//  ItemAdderPresenter.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 19..
//

import Foundation
import SwiftUI

class ItemAdderPresenter: ObservableObject{
    private let interactor: ItemAdderInteractor
    
    init(interactor: ItemAdderInteractor){
        self.interactor = interactor
    }
    
    func addItem(name: String, description: String, date: Date){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let stringdate = dateFormatter.string(from: date)
        
        self.interactor.addItem(todo: Todo(name: name, description: description, date: stringdate, isDone: false))
    }
}
