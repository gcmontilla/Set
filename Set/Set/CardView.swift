//
//  CardView.swift
//  Set
//
//  Created by Gregory Montilla on 12/26/20.
//

import SwiftUI

struct CardView: View {
    var card: SetGameModel.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack{
            VStack {
                ForEach(0..<card.numberOfSymbols) { _ in
                    buildSymbol(from: card)
                }
            }
                .padding()
        }
            .cardify()
            .transition(.scale)
    }
    
    private func buildSymbol(from: SetGameModel.Card) -> some View {
        let overlay = getSymbol(from: card.symbol).stroke(lineWidth: lineWidth)
            .fill(card.color)
        let symbol = getSymbol(from: card.symbol)
            .fill(card.color)
            .opacity(card.opacity)
            .overlay(overlay)
        
        return AnyView(symbol)
    }
    
    // MARK: - Drawing Constraints
    private let lineWidth: CGFloat = 3
    private let cornerRadius: CGFloat = 5
    private let padding: CGFloat = 5
}

struct AnyShape: Shape {
    init<S: Shape>(_ wrapped: S) {
            _path = { rect in
                let path = wrapped.path(in: rect)
                return path
            }
        }

        func path(in rect: CGRect) -> Path {
            return _path(rect)
        }

        private let _path: (CGRect) -> Path
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = SetGameModel.Card(id: 0, symbol: Symbol.diamond, color: .green, opacity: 0.5, numberOfSymbols: 3)
        CardView(card: card)
    }
}
