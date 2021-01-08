//
//  Cardify.swift
//  Set
//
//  Created by Gregory Montilla on 12/27/20.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    func body(content: Content) -> some View {
        ZStack {
//            RoundedRectangle(cornerRadius: cornerRadius)
//                .stroke(Color.black , lineWidth: lineWidth)
            content
        }
    }
    
    private let lineWidth: CGFloat = 3
    private let cornerRadius: CGFloat = 5
}

extension View {
    func cardify() -> some View {
        modifier(Cardify())
    }
}
