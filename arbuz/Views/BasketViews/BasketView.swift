//
//  BasketView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 19.05.2024.
//

import SwiftUI

struct BasketView: View {
    var isAdded: Bool
    var body: some View {
        if(isAdded) {
            VStack {
                Text("Basket is not empty")
            }
        } else {
            ZStack {
                VStack(alignment: .center){
                    HStack{
                        Text("Корзина")
                            .font(.system(size: 16, weight: .semibold))
                        Text("")
                    }
                    Spacer()
                }
                
                EmptyBasketView()
            }
        }
    }
}


#Preview {
    BasketView(isAdded: false)
}
