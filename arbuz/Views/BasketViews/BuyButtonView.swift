//
//  BuyButtonView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 22.05.2024.
//

import SwiftUI

struct BuyButtonView: View {
    @EnvironmentObject var basketVM: BasketViewModel
    @State private var isLoading = false
    @State private var isThanksViewVisible = false
    
    var totalSum: Decimal {
        basketVM.products.reduce(into: Decimal(0)) { sum, item in
            let product = item.key
            let quantity = item.value
            sum += ((product.cost ?? 0) as Decimal) * Decimal(quantity)
        }
    }
    
    var body: some View {
        VStack {
            if(totalSum < 8000) {
                Text("До бесплатной доставки \(8000 - totalSum) тг")
                    .font(.subheadline)
            }
            Button(action: {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                    isThanksViewVisible = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    basketVM.clearBasket()
                    
                }
                
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
        }

        .padding(.trailing)
        .sheet(isPresented: $isThanksViewVisible) {
            ThanksView()
        }
        .overlay(
            Group {
                if isLoading {
                    Color.white.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .overlay(ProgressView())
                }
            }
        )
    }
}
struct ThanksView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Спасибо за покупку!")
                .font(.system(size: 45, weight: .semibold))
                .foregroundColor(.green)
                .padding()
            Spacer()
        }
    }
}
