//
//  StaticGridView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 19.05.2024.
//

import SwiftUI

struct StaticGridView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var product: FetchedResults<Product>
    @EnvironmentObject var basketVM: BasketViewModel
    @StateObject private var selectedProductsVM = SelectedProductsViewModel(products: [])

    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    
    var body: some View {
        HStack {
            Text("Arbuz Selected")
                .font(.system(size: 20, weight: .bold))
            Spacer()
        }
        NavigationView {
            VStack(spacing: 20) {
                ForEach(splitProducts(products: selectedProductsVM.selectedProducts), id: \.self) { rowProducts in
                    HStack(spacing: 10) {
                        ForEach(rowProducts, id: \.self) { product in
                            ProductCellView(product: product)
                        }
                    }
                }
            }
        }
        .onAppear {
            if selectedProductsVM.selectedProducts.isEmpty {
                selectedProductsVM.selectedProducts = Array(product.shuffled().prefix(6))
                }
            }
    }
    
    private func splitProducts(products: [Product]) -> [[Product]] {
        var result: [[Product]] = []
        var currentRow: [Product] = []
        var count = 0
        
        for product in products {
            currentRow.append(product)
            count += 1
            
            if count == 3 {
                result.append(currentRow)
                currentRow = []
                count = 0
            }
        }
        
        if !currentRow.isEmpty {
            result.append(currentRow)
        }
        
        return result
    }
}


#Preview {
    StaticGridView()
}
