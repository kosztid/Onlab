//
//  LoginScreenPresenter.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 22..
//

import Foundation
import SwiftUI

class LoginScreenPresenter: ObservableObject{
    private let interactor: LoginScreenInteractor
    private let router = LoginScreenRouter()
    
    init(interactor: LoginScreenInteractor){
        self.interactor = interactor
    }
    
    func signIn(email: String, password: String){
        interactor.signIn(email: email, password: password)
    }
    
    func toRegisterView() -> some View{
        NavigationLink("Regisztráció", destination: router.makeRegisterView(model: interactor.model))
    }
    
    func toForgotPasswordView() -> some View{
        NavigationLink("Elfelejtett jelszó",destination: Text("elfejeletett pw"))
    }
}
