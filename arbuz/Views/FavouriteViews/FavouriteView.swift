//
//  FavouriteView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 19.05.2024.
//

import SwiftUI

struct FavouriteView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        sortDescriptors: [],
        predicate: NSPredicate(format: "category == %@", "drinks")
    ) var product: FetchedResults<Product>
    
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
           Text("")
            ScrollView {
                HStack {
                    Text("Drinks")
                        .padding(.leading)
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                }
                LazyVGrid(columns: columns) {
                    ForEach(product) { product in
                        ProductCellView(product: product)
                    }
                }
                .padding()
            }
            
        }
    }
}

#Preview {
    FavouriteView()
}
