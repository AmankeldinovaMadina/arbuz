//
//  ProductView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 18.05.2024.
//

import SwiftUI

struct ProductCellView: View {
    var product: Product
    
    @EnvironmentObject var basketVM: BasketViewModel
    @StateObject var detailVM: ProductDetailViewModel
    @EnvironmentObject var favoriteVM: FavouriteViewModel
    
    init(product: Product) {
        self.product = product
        _detailVM = StateObject(wrappedValue: ProductDetailViewModel())
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing){
                Image(product.image ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(16)
                Button(action: {
                    favoriteVM.toggleFavorite(for: product)
                }, label: {
                    let isFavorite = favoriteVM.favoriteProducts.contains(product)
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(Color.black)
                    
                })
                
            }
            Text(product.productDescription ?? "Unknown Product")
                .padding(.top, 5)
                .font(.system(size: 12))
                .lineLimit(2)
                .truncationMode(.tail)
            HStack {
                if detailVM.quantity > 1 {
                    let totalCost = product.cost?.multiplying(by: NSDecimalNumber(value: detailVM.quantity)) ?? 0
                    Text("\(totalCost) тг")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color.gray)
                } else {
                    Text("\(Int(truncating: product.cost ?? 0)) \(product.category == "drinks" ? "тг/шт" : "тг/кг")")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color.gray)
                }
                Spacer()
            }
            AddButton(cost: Int(truncating: product.cost ?? 0), category: product.category ?? "", detailVM: detailVM)
                .onAppear {
                    detailVM.basketVM = basketVM
                    detailVM.product = product
                }
        }
    }
}

struct AddButton: View {
    var cost: Int
    var category: String
    @StateObject var detailVM: ProductDetailViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(detailVM.quantity == 0 ? Color(red: 0.9, green: 0.9, blue: 0.9) : Color.green)
                .frame(height: 30)
            HStack {
                if detailVM.quantity == 0 {
                    Text("\(cost) тг")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.leading)
                    Spacer()
                    Button(action: {
                        detailVM.addQuantity(isAdd: true)
                    }, label: {
                        Text("+")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.green)
                            .padding(.trailing)
                    })
                } else {
                    Button(action: {
                        detailVM.addQuantity(isAdd: false)
                    }, label: {
                        Text("-")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.white)
                            .padding(.leading)
                    })
                    Text("\(Int(detailVM.quantity)) \(category == "drinks" ? "шт" : "кг")")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.horizontal)
                    Button(action: {
                        detailVM.addQuantity(isAdd: true)
                    }, label: {
                        Text("+")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.white)
                            .padding(.trailing)
                    })
                }
            }
        }
    }
}
