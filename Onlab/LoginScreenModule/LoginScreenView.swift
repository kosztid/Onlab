//
//  LoginScreenView.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 22..
//

import SwiftUI

struct LoginScreenView: View {
    @ObservedObject var presenter: LoginScreenPresenter
    @State var email : String = ""
    @State var password : String = ""
    @State private var isSecured: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(#colorLiteral(red: 0.9616488814, green: 0.7044866681, blue: 0.198040545, alpha: 0.2314946181)).ignoresSafeArea(.all)
                
                VStack{
                    Label("",systemImage: "house")
                        .font(.system(size: 200))
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.3861519694, blue: 0.6265576482, alpha: 0.5483149314)))
                    Text("Bejelentkezés")
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
                        guard presenter.isValidEmail(email: self.email), !self.password.isEmpty else {
                            return
                        }
                        presenter.signIn(email: self.email, password: self.password)
                    } label : {
                        Text("Bejelentkezés")
                            .frame(height:50)
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 20))
                            .background(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    HStack{
                        Spacer()
                        presenter.toRegisterView()
                        Spacer()
                        
                        presenter.toForgotPasswordView()
                        
                        Spacer()
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0.4445468485, green: 0.6308674216, blue: 0.7150720954, alpha: 1)))
                }
                .padding(10)
            }
            
        }
        .navigationBarHidden(true)
        .background(Color(#colorLiteral(red: 0.9616488814, green: 0.7044866681, blue: 0.198040545, alpha: 0.2314946181)))
        .navigationTitle("Bejelentkezés")
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView(presenter: LoginScreenPresenter(interactor: LoginScreenInteractor(model: DataModel())))
    }
}
