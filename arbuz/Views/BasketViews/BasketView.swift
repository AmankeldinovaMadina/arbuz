//
//  BasketView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 19.05.2024.
//

import SwiftUI

struct BasketView: View {
    @EnvironmentObject var basketVM: BasketViewModel
    @EnvironmentObject var favoriteVM: FavouriteViewModel
    
    var body: some View {
        if(basketVM.products.count > 0) {
            BasketWithItemsView()
        } else {
            ZStack {
                VStack(alignment: .center){
                    HStack{
                        Text("Корзина")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.top)
                        Text("")
                    }
                    Spacer()
                }
                
                EmptyBasketView()
            }
        }
    }
}

