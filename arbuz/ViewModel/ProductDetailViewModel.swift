//
//  ProductDetailViewModel.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 20.05.2024.
//

import SwiftUI

class ProductDetailViewModel: ObservableObject {
//    @Published var product: Product
    @Published var quantity: Int = 0
    
    func addQuantity(isAdd: Bool = true ) {
        if(isAdd) {
            quantity += 1
            if(quantity > 99) {
                quantity = 99
            }
        } else {
            quantity -= 1
            if(quantity < 0) {
                quantity = 0
            }
        }
    }
}

