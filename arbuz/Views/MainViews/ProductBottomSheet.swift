//
//  ProductBottomSheet.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 22.05.2024.
//

import SwiftUI

struct ProductBottomSheet: View {
    var product: Product
    @Binding var isPresented: Bool
    @EnvironmentObject var favoriteVM: FavouriteViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isPresented = false
                }, label: {
                    Text("x")
                        .font(.system(size: 20, weight: .semibold))
                })
                
                Spacer()
                Image(systemName: "square.and.arrow.up")
                    .frame(width: 30, height: 30)
                Button(action: {
                    favoriteVM.toggleFavorite(for: product.id ?? UUID())
                }, label: {
                    let isFavorite = favoriteVM.favoriteProductIDs.contains(product.id ?? UUID())
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(Color.black)
                        .frame(width: 30, height: 30)
                })
            }
            Image(product.image ?? "")
                .resizable()
                .scaledToFit()
                .cornerRadius(16)
            Text(product.name ?? "")
                .font(.system(size: 24, weight: .bold))
            Text("\(Int(truncating: product.cost ?? 0)) \(product.category == "drinks" ? "тг/шт" : "тг/кг")")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Color.gray)
            VStack (alignment: .leading) {
                Text(product.productDescription ?? "")
                    .font(.system(size: 16))
                    .padding(.top, 20)
                
            }
            
            Spacer()
        }
        .padding()
    }
}

