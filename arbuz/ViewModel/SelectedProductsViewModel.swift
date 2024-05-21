//
//  SelectedProductsViewModel.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 21.05.2024.
//
 
import SwiftUI
import Combine

class SelectedProductsViewModel: ObservableObject {
    @Published var selectedProducts: [Product] = []

    init(products: [Product]) {
        self.selectedProducts = Array(products.shuffled().prefix(6))
    }
}

