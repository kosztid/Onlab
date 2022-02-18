//
//  DoneButton.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import SwiftUI

struct DoneButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(){
            isSet.toggle()
        } label: {
            Label("",systemImage: isSet ? "checkmark.circle" : "circle")
                .foregroundColor(isSet ? .green : .red)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct DoneButton_Previews: PreviewProvider {
    static var previews: some View {
        DoneButton(isSet: .constant(true))
    }
}
