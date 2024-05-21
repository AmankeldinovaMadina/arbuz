//
//  arbuzApp.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 17.05.2024.
//

import SwiftUI

@main
struct arbuzApp: App {
    @StateObject private var dataController = DataController()
    let favouriteViewModel = FavouriteViewModel()
    let detailViewModel = ProductDetailViewModel()
    let basketViewModel = BasketViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(favouriteViewModel)
                .environmentObject(detailViewModel)
                .environmentObject(basketViewModel)
        }
    }
}
