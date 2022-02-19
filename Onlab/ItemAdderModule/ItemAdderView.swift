//
//  ItemAdderView.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 19..
//

import SwiftUI

struct ItemAdderView: View {
    @Environment(\.presentationMode) private var presentationMode
    @Binding var showView : Bool
    @State var todoname : String = ""
    @State var tododescription : String = ""
    @State var tododate = Date()
    @ObservedObject var presenter: ItemAdderPresenter
    
    var body: some View {
        ScrollView {
            VStack{
                TextField("Teendő neve", text: $todoname)
                    .padding(.horizontal)
                    .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 20))
                    .background(Color(#colorLiteral(red: 0.8875433803, green: 0.8876925111, blue: 0.8875238299, alpha: 1)))
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                
                TextField("Teendő leírása", text: $tododescription)
                    .padding(.horizontal)
                    .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 20))
                    .background(Color(#colorLiteral(red: 0.8875433803, green: 0.8876925111, blue: 0.8875238299, alpha: 1)))
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                
                DatePicker(selection: $tododate, displayedComponents: .date) {
                                Text("Select a date")
                            }
                Button{
                    presenter.addItem(todo: Todo(name:todoname,description: tododescription, date: tododate))
                    self.presentationMode.wrappedValue.dismiss()
                } label : {
                    Text("Add")
                        .frame(height:50)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 20))
                        .background(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
                        .cornerRadius(10)
                }
            }
            .padding(10)
        }
        .navigationTitle("Új hozzáadása")
    }
}

struct TodoAdder_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel()
        let interactor = ItemAdderInteractor(model: model)
        let presenter = ItemAdderPresenter(interactor: interactor)
        NavigationView{
            ItemAdderView(showView: .constant(false),presenter: presenter)
        }
        .environmentObject(DataModel())
    }
}
