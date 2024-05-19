//
//  SearchTextFieldView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 19.05.2024.
//

import SwiftUI

struct SearchTextFieldView: View {
    @State var placeholder: String = "Искать на Арбузе"
    @Binding var text: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 14, height: 14)
                .padding(.leading)
            TextField(placeholder,text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(height: 40)
            
        }
        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
        .cornerRadius(12)
    }
}

#Preview {
    SearchTextFieldView(text: .constant(""))
}
