//
//  AlwaysVisibleFooterModifier.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 22.05.2024.
//

import SwiftUI

struct AlwaysVisibleFooterModifier<Footer: View>: ViewModifier {
    let footer: Footer
    let alignment: Alignment
    
    init(footer: Footer, alignment: Alignment = .bottom) {
        self.footer = footer
        self.alignment = alignment
    }
    
    func body(content: Content) -> some View {
        ZStack(alignment: alignment) {
            content
                .zIndex(0)
            footer
                .zIndex(1)
                .background(Color.white.opacity(0.001))
        }
    }
}

extension View {
    func alwaysVisibleFooter<Footer: View>(footer: Footer, alignment: Alignment = .bottom) -> some View {
        self.modifier(AlwaysVisibleFooterModifier(footer: footer, alignment: alignment))
    }
}
