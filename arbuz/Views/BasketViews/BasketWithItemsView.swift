//
//  BasketWithItemsView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 20.05.2024.
//

import SwiftUI

struct BasketWithItemsView: View {
    @EnvironmentObject var basketVM: BasketViewModel
    @EnvironmentObject var favoriteVM: FavouriteViewModel
    @StateObject var detailVM: ProductDetailViewModel
    var body: some View {
           List {
               ForEach(basketVM.products.keys.sorted(by: { $0.id < $1.id }), id: \.self) { product in
                   BasketCellView(product: product, detailVM: detailVM)
                       .padding()
               }
           }
           .listStyle(PlainListStyle())
       }
}

