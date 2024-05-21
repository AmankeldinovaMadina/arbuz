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
    var badgeCnt: Int?
    
    var body: some View {
        Button(action: didSelect) {
            VStack(spacing: 4) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(isSelected ? Color.green : Color.black)
                    
                    if let badgeCnt = badgeCnt, badgeCnt > 0 {
                        Text("\(badgeCnt)")
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                            .padding(4)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: 6, y: -6)
                    }
                }
                
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(isSelected ? Color.green : Color.black)
            }
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
