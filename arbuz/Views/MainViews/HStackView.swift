//
//  HStackView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 19.05.2024.
//

import SwiftUI

struct HStackView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var title: String
    var category: Category
    
    @FetchRequest(sortDescriptors: []) var products: FetchedResults<Product>
    
//    @FetchRequest(
//        sortDescriptors: [],
//        predicate: NSPredicate(format: "category == %@", "drinks")
//    ) var product: FetchedResults<Product>
    @EnvironmentObject var favoriteVM: FavouriteViewModel
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 20, weight: .bold))
            Spacer()
        }
        NavigationView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.flexible())]) {
                    ForEach(products) { product in
                        if product.category == category.rawValue {
                            ProductCellView(product: product)
                                .frame(width: UIScreen.main.bounds.width / 3)
                        }
                    }
                }

                .padding()
            }
            
        }
        .scaledToFit()
    }
}

#Preview {
    HStackView(title: "Temp", category: Category.drinks)
}
