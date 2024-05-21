//
//  BasketCellView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 21.05.2024.
//

import SwiftUI

struct BasketCellView: View {
    var product: Product
    
    @EnvironmentObject var basketVM: BasketViewModel
    @StateObject var detailVM: ProductDetailViewModel
    @EnvironmentObject var favoriteVM: FavouriteViewModel
    
 
    var body: some View {
        HStack {
            ZStack (alignment: .topTrailing) {
                Image(product.image ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(16)
                    
            }
            
            VStack(alignment: .leading) {
                Text(product.name ?? "Unknown Product")
                    .padding(.top, 5)
                    .font(.system(size: 16, weight: .semibold))
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                HStack {
                    Text("\(Int(truncating: product.cost ?? 0)) \(product.category == "drinks" ? "тг/шт" : "тг/кг")")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color.gray)
                }
                
                Spacer()
                
                BasketAddButton(cost: Int(truncating: product.cost ?? 0), category: product.category ?? "" , product: product, detailVM: detailVM)
                    .onAppear {
                        detailVM.basketVM = basketVM
                        detailVM.product = product
                    }
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Button(action: {}) {
                    Image(systemName: "x.square")
                        .foregroundColor(Color.gray)
                }
                
                Spacer()
                
                if basketVM.products[product] ?? 0 > 0 {
                    let totalCost = product.cost?.multiplying(by: NSDecimalNumber(value: basketVM.products[product] ?? 0)) ?? 0
                    Text("\(totalCost) тг")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color.gray)
                } else {
                    Text("\(Int(truncating: product.cost ?? 0) * detailVM.quantity) тг")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}


struct BasketAddButton: View {
    var cost: Int
    var category: String
    var product: Product
    
    @EnvironmentObject var basketVM: BasketViewModel
    @StateObject var detailVM: ProductDetailViewModel
    @EnvironmentObject var favoriteVM: FavouriteViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(basketVM.products[product] == 0 ? Color(red: 0.9, green: 0.9, blue: 0.9) : Color.green)
                .frame(height: 30)
            HStack {
                    Button(action: {
                        detailVM.addQuantity(isAdd: false)
                    }, label: {
                        Text("-")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.white)
                            .padding(.leading)
                    })
                    Text("\(Int(basketVM.products[product] ?? 0)) \(category == "drinks" ? "шт" : "кг")")
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
