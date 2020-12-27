//
//  CardView.swift
//  Set
//
//  Created by Gregory Montilla on 12/26/20.
//

import SwiftUI

struct CardView: View {
    var card: SetGameModel.Card
    var color: Color {
        getColor(of: card.color)
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        VStack {
            ForEach(0..<card.numberOfShapes) { _ in
                buildSymbol(from: card)
            }
        }
    }
    
    private func buildSymbol(from: SetGameModel.Card) -> some View {
        let color = getColor(of: card.color)
        let overlay = getSymbol(from: card.symbol).stroke(lineWidth: lineWidth).fill(color)
        let symbol = getSymbol(from: card.symbol).fill(color).opacity(card.opacity).overlay(overlay)
        
        return AnyView(symbol)
    }
    
    private func getSymbol(from string: String) -> some Shape {
        switch string {
        case "rectangle":
            return AnyShape(RoundedRectangle(cornerRadius: cornerRadius))
        case "circle":
            return AnyShape(Circle())
        default:
            return AnyShape(Diamond())
        }
    }
    
    private func getColor(of string: String) -> Color{
        switch string {
        case "green":
            return Color.green
        case "red":
            return Color.red
        default:
            return Color.blue
        }
    }
    
    // MARK: - Drawing Constraints
    private let lineWidth: CGFloat = 3
    private let cornerRadius: CGFloat = 5
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
//        CardView()
//    }
//}
