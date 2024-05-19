//
//  TabButton.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 19.05.2024.

import SwiftUI

struct TabButton: View {
    let title: String
    let icon: String
    @Binding var isSelected: Bool
    var didSelect: () -> Void
    
    var body: some View {
        Button {
            debugPrint("Tab button tapped: \(title)")
            didSelect()
        } label: {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
            }
            .foregroundColor(isSelected ? Color.green : Color.black)
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

#Preview {
    @State var isSelected = true
    return TabButton(title: "Title", icon: "house", isSelected: $isSelected) {
        print("Test")
    }
}
