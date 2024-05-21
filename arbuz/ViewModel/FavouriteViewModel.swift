//
//  FavouriteViewModel.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 21.05.2024.
//

import Foundation

class FavouriteViewModel: ObservableObject {
    @Published var favoriteProducts: [Product] = []
    
    func toggleFavorite(for product: Product) {
        if let index = favoriteProducts.firstIndex(where: { $0.id == product.id }) {
            favoriteProducts.remove(at: index)
            debugPrint("Fav add")
        } else {
            favoriteProducts.append(product)
            debugPrint("Fav remove")
        }
    }
}
