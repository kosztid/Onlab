//
//  IconsListRouter.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 19..
//

import Foundation
import SwiftUI

class IconsListRouter{
    func makeAdderView(model: DataModel) -> some View{
        let presenter = ItemAdderPresenter(interactor: ItemAdderInteractor(model: model))
        return ItemAdderView(showView: .constant(false), presenter: presenter)
    }
}
