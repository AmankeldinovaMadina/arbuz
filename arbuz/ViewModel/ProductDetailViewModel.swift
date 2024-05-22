//
//  ProductDetailViewModel.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 20.05.2024.
//

import SwiftUI

class ProductDetailViewModel: ObservableObject {

    @Published var quantity: Int = 0
    var basketVM: BasketViewModel?
    var product: Product?
    
    func addQuantity(isAdd: Bool) {
        if isAdd {
            quantity += 1
            basketVM?.addProduct(product!)
        } else if quantity > 0 {
            quantity -= 1
            basketVM?.removeProduct(product!)
        }
    }
    

}

