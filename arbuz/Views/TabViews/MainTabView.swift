//
//  TabView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 19.05.2024.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var mainVM = MainViewModel.shared
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var product: FetchedResults<Product>
    
    var body: some View {
        VStack {
            TabView(selection: $mainVM.selectedTab) {
                MainView().tag(0)
                    .environment(\.managedObjectContext, managedObjectContext)
                BasketView().tag(1)
                FavouriteView().tag(2)
            }
            .onAppear {
                UIScrollView.appearance().isScrollEnabled = false
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: mainVM.selectedTab) { newValue in
                debugPrint("Selected Tab: \(newValue)")
            }
            
            HStack {
                TabButton(title: "Главная", icon: "house", isSelected: .constant(mainVM.selectedTab == 0)) {
                    withAnimation {
                        mainVM.selectedTab = 0
                    }
                }
                
                TabButton(title: "Корзина", icon: "basket", isSelected: .constant(mainVM.selectedTab == 1)) {
                    withAnimation {
                        mainVM.selectedTab = 1
                    }
                }
                
                TabButton(title: "Избранная", icon: "heart", isSelected: .constant(mainVM.selectedTab == 2)) {
                    withAnimation {
                        mainVM.selectedTab = 2
                    }
                }
            }
            .padding(.bottom)
            .background(Color.white)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
