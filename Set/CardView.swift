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
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(card.isSelected ? Color.yellow : Color.black , lineWidth: lineWidth)
            VStack {
                ForEach(0..<card.numberOfShapes) { _ in
                    buildSymbol(from: card).frame(width: size.width/2, height: size.height/10, alignment: .center)
                }
            }.padding(padding)
        }
            .padding(padding)
    }
    
    private func buildSymbol(from: SetGameModel.Card) -> some View {
        let overlay = getSymbol(from: card.symbol).stroke(lineWidth: lineWidth).fill(card.color)
        let symbol = getSymbol(from: card.symbol).fill(card.color).opacity(card.opacity).overlay(overlay)
        
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

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(card: <#SetGameModel.Card#>)
//    }
//}
