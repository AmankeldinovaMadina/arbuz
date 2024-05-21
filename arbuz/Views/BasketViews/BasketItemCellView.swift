//
//  BasketItemCellView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 21.05.2024.
//

import SwiftUI

struct BasketItemCellView: View {
    var product: Product
    var quantity: Int
    
    var body: some View {
        VStack {
            Text(product.name ?? "")
            Text("\(quantity)")
        }
    }
}

//#Preview {
//    // Create a mock Product object for preview purposes
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    let mockProduct = Product(context: context)
//    mockProduct.id = UUID()
//    mockProduct.name = "Sample Product"
//    mockProduct.cost = 100
//
//    return BasketItemCellView(product: mockProduct, quantity: 5)
//}

