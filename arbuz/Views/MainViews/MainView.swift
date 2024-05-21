//
//  MainView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 18.05.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainVM = MainViewModel.shared
    @EnvironmentObject var basketVM: BasketViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 16){
                    Image("arbuz_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                        .padding(.bottom)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Алматы, сегодня 17:00 - 19:00")
                                .font(.system(size: 12))
                            Text("улица Макатаева, 127/1 проспект...")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        
                        Spacer()
                        Image(systemName: "arrow.down")
                            .padding(.trailing)
                        Image(systemName: "bell")
                    }
                    SearchTextFieldView(text: $mainVM.searchTxt)
                    Image("banner")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                    
                    StaticGridView()
                    HStackView(title: "Drinks", category: Category.drinks)

                }
                .padding(.horizontal)
                
            }
        }
    }
}

#Preview {
    MainView()
}
