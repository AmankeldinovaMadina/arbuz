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
    @StateObject var detailVM: ProductDetailViewModel
    
    var body: some View {
        Group {
            if basketVM.products.count > 0 {
                BasketWithItemsView(detailVM: detailVM)
                    .alwaysVisibleFooter(footer: BuyButtonView())
            } else {
                ZStack {
                    VStack(alignment: .center) {
                        HStack {
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
        .alwaysVisibleFooter(footer: EmptyView())
    }
}

struct EmptyView: View {
    var body: some View {
        HStack {
            Text("")
        }
    }
}
