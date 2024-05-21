//
//  FavouriteViewModel.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 21.05.2024.
//
import Foundation
import CoreData

class FavouriteViewModel: ObservableObject {
    @Published var favoriteProductIDs: Set<UUID> = []
    private let favoritesKey = "favoriteProductIDs"
    
    init() {
        if let savedFavoritesData = UserDefaults.standard.data(forKey: favoritesKey),
           let savedFavorites = try? JSONDecoder().decode(Set<UUID>.self, from: savedFavoritesData) {
            favoriteProductIDs = savedFavorites
        }
    }
    
    func toggleFavorite(for productID: UUID) {
        
        if favoriteProductIDs.contains(productID ?? UUID()) {
            favoriteProductIDs.remove(productID ?? UUID())
            debugPrint("Fav remove")
        } else {
            favoriteProductIDs.insert(productID ?? UUID())
            debugPrint("Fav add")
        }
         
        saveFavoriteProductIDs()
    }
     
    private func saveFavoriteProductIDs() {
        if let encodedFavorites = try? JSONEncoder().encode(favoriteProductIDs) {
            UserDefaults.standard.set(encodedFavorites, forKey: favoritesKey)
        }
    }
}
