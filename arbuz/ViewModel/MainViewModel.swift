//
//  MainViewModel.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 19.05.2024.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()
    
    @Published var selectedTab: Int  = 0
    @Published var searchTxt: String = ""
    
}

