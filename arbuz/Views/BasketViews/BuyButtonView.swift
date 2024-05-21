//
//  BuyButtonView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 22.05.2024.
//

import SwiftUI

struct BuyButtonView: View {
    @EnvironmentObject var basketVM: BasketViewModel
    
    var totalSum: Decimal {
        basketVM.products.reduce(into: Decimal(0)) { sum, item in
            let product = item.key
            let quantity = item.value
            sum += ((product.cost ?? 0) as Decimal) * Decimal(quantity)
        }
    }
    
    var body: some View {
        Button(action: {
            // Action for the button
        }, label: {
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(height: 50)
                    .cornerRadius(16)
                    
                Text("Total: \(Double(truncating: totalSum as NSNumber), specifier: "%.2f") тг")
                    .foregroundColor(.white)
                    .bold()
            }
        })
        .padding(.trailing)
    }
}



