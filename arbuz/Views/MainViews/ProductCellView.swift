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
                .lineLimit(2)
                .truncationMode(.tail)
            HStack {
                Text("\(Int(truncating: product.cost ?? 0)) \(product.category == "drinks" ? "тг/шт" : "тг/кг") ")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                Spacer()
            }
            AddButton(cost: Int(truncating: product.cost ?? 0))

        }
        .padding()
    }
}


struct AddButton: View {
    var cost: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 0.8, green: 0.8, blue: 0.8))
            HStack {
                Text("\(cost) тг ")
                    .font(.headline)
                    .padding(.leading)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("+")
                        .font(Font.system(size: 25).weight(.semibold))
                        .foregroundColor(Color.green)
                        .padding(.trailing)
                })
            }
        }
        
    }
}
