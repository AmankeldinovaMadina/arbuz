//
//  BasketViewModel.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 21.05.2024.
//

import SwiftUI

class BasketViewModel: ObservableObject {
    @Published var products: [Product: Int] = [:]
    
    func addProduct(_ product: Product) {
        if let quantity = products[product] {
            products[product] = quantity + 1
        } else {
            products[product] = 1
        }
    }
    
    func removeProduct(_ product: Product) {
        if let quantity = products[product], quantity > 1 {
            products[product] = quantity - 1
        } else {
            products[product] = nil
        }
    }
    
    var totalCost: NSDecimalNumber {
        products.reduce(NSDecimalNumber.zero) { total, item in
            total.adding(item.key.cost!.multiplying(by: NSDecimalNumber(value: item.value)))
        }
    }
}

//#Preview {
//    BasketViewModel()
//}
