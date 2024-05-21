//
//  FavouriteView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 19.05.2024.
//

import SwiftUI

struct FavouriteView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var favoriteVM: FavouriteViewModel
    @FetchRequest(sortDescriptors: []) var products: FetchedResults<Product>
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
           Text("")
            ScrollView {
                VStack(alignment: .center){
                    HStack{
                        Text("Корзина")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.top)

                    }
                    Spacer()
                }
                LazyVGrid(columns: columns) {
                    ForEach(Array(favoriteVM.favoriteProductIDs), id: \.self) { productId in
                        if let product = getProduct(for: productId) {
                            ProductCellView(product: product)
                        }
                    }


                    }
                .padding()
            }
            
        }
    }
    
    private func getProduct(for productId: UUID) -> Product? {
        products.first(where: { $0.id == productId })
        }
}

#Preview {
    FavouriteView()
}
