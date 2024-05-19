//
//  ProductView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 18.05.2024.
//

import SwiftUI

struct ProductCellView: View {
    var product: Product
    
    var body: some View {
        VStack {
            Image(product.image ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            
            Text(product.productDescription ?? "Unknown Product")
                .padding(.top, 5)
                .font(.system(size: 12))
                .lineLimit(2)
                .truncationMode(.tail)
            HStack {
                Text("\(Int(truncating: product.cost ?? 0)) \(product.category == "drinks" ? "тг/шт" : "тг/кг") ")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Color.gray)
                Spacer()
            }
            AddButton(cost: Int(truncating: product.cost ?? 0))

        }
//        .padding()
    }
}


struct AddButton: View {
    var cost: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                .frame(height: 30)
            HStack {
                Text("\(cost) тг ")
                    .font(.system(size: 14, weight: .bold))
                    .padding(.leading)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("+")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color.green)
                        .padding(.trailing)
                })
            }
        }
        
    }
}
