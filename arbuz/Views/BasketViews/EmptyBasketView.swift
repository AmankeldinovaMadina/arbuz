//
//  EmptyBasketView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 20.05.2024.
//

import SwiftUI

struct EmptyBasketView: View {
    var body: some View {
        VStack (spacing: 16){
            Image("basket_empty")
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height / 3.5)
            Text("Ваша корзина пока пуста")
                .font(.system(size: 20, weight: .semibold))
            Text("Здесь будут лежать товары для покупки")
                .font(.system(size: 16))
                .foregroundColor(Color.gray)
            CatalogButton()
        }
    }
}


struct CatalogButton: View {
    var body: some View {
        
        Button(action: {
            
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.green)
                    .frame(height: 50)
                Text("Перейти в каталог")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding(.horizontal, 90)
        })
    }
}
#Preview {
    EmptyBasketView()
}
