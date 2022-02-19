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
    
    func addItem(todo: Todo){
        self.interactor.addItem(todo: todo)
    }
}
