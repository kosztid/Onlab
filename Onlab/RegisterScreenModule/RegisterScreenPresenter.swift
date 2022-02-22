//
//  RegisterScreenPresenter.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 22..
//

import Foundation


class RegisterScreenPresenter: ObservableObject{
    private let interactor: RegisterScreenInteractor
    
    init(interactor: RegisterScreenInteractor){
        self.interactor = interactor
    }
    
    func register(email: String, password: String){
        interactor.register(email: email, password: password)
    }
}
