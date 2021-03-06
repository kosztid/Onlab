//
//  RegisterScreenView.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 22..
//

import SwiftUI

struct RegisterScreenView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var presenter: RegisterScreenPresenter
    @State var email : String = ""
    @State var password : String = ""
    @State var isSecured: Bool = true
    var body: some View {
        ScrollView {
            VStack{
                Label("",systemImage: "network")
                    
                    .font(.system(size: 200))
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.3861519694, blue: 0.6265576482, alpha: 0.5483149314)))
                Text("Regisztráció")
                    .font(.system(size: 50))
                    .padding(10)
                TextField("Email", text: $email)
                    .padding(.horizontal)
                    .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 20))
                    .background(Color(#colorLiteral(red: 0, green: 0.6347943544, blue: 1, alpha: 0.1996611511)))
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                
                ZStack(alignment: .trailing) {
                            if isSecured {
                                SecureField("Password", text: $password)
                                    .padding(.horizontal)
                                    .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .font(.system(size: 20))
                                    .background(Color(#colorLiteral(red: 0, green: 0.6347943544, blue: 1, alpha: 0.1996611511)))
                                    .cornerRadius(10)
                                    .disableAutocorrection(true)
                            } else {
                                TextField("Password", text: $password)
                                    .padding(.horizontal)
                                    .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .font(.system(size: 20))
                                    .background(Color(#colorLiteral(red: 0, green: 0.6347943544, blue: 1, alpha: 0.1996611511)))
                                    .cornerRadius(10)
                                    .disableAutocorrection(true)
                            }
                            Button(action: {
                                isSecured.toggle()
                            }) {
                                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                    .accentColor(.gray)
                            }.offset(x: -20)
                        }

                Button{
                    guard presenter.isValidEmail(email: self.email), self.password.count > 5 else {
                        return
                    }
                    presenter.register(email: self.email, password: self.password)
                    presentationMode.wrappedValue.dismiss()
                } label : {
                    Text("Fiók létrehozása")
                        .frame(height:50)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 20))
                        .background(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            .padding(10)
        }
        .navigationTitle("Regisztráció")
        .background(Color(#colorLiteral(red: 0.9616488814, green: 0.7044866681, blue: 0.198040545, alpha: 0.2314946181)))
    }
}

struct RegisterScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreenView(presenter: RegisterScreenPresenter(interactor: RegisterScreenInteractor(model: DataModel())))
    }
}
