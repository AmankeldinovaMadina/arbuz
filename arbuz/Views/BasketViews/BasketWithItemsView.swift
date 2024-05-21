//
//  BasketWithItemsView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 20.05.2024.
//

import SwiftUI

struct BasketWithItemsView: View {
    @EnvironmentObject var basketVM: BasketViewModel
    
    var body: some View {
           List {
               ForEach(basketVM.products.keys.sorted(by: { $0.id < $1.id }), id: \.self) { product in
                   HStack {
                       VStack(alignment: .leading) {
                           Text(product.productDescription ?? "Unknown Product")
                               .font(.headline)
                           Text("\(product.category == "drinks" ? "\(basketVM.products[product] ?? 0) шт" : "\(basketVM.products[product] ?? 0) кг")")
                               .font(.subheadline)
                       }
                       Spacer()
                       Text("\( NSDecimalNumber(value: basketVM.products[product] ?? 1)) тг")
                           .font(.subheadline)
                   }
                   .padding()
               }
           }
           .listStyle(PlainListStyle())
       }
}

#Preview {
    BasketWithItemsView()
}
