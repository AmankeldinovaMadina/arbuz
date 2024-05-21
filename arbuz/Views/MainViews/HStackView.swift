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
    @FetchRequest(
        sortDescriptors: [],
        predicate: NSPredicate(format: "category == %@", "drinks")
    ) var product: FetchedResults<Product>
    @EnvironmentObject var favoriteVM: FavouriteViewModel
    var body: some View {
        HStack {
            Text("Drinks")
                .font(.system(size: 20, weight: .bold))
            Spacer()
        }
        NavigationView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.flexible())]) {
                    ForEach(product) { product in
                        ProductCellView(product: product)
                            .frame(width: UIScreen.main.bounds.width / 3)
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
