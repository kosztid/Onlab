//
//  LoginScreenPresenter.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 22..
//

import Foundation
class LoginScreenPresenter: ObservableObject{
    private let interactor: LoginScreenInteractor
    
    init(interactor: LoginScreenInteractor){
        self.interactor = interactor
    }
    
    func signIn(email: String, password: String){
        interactor.signIn(email: email, password: password)
    }
}
