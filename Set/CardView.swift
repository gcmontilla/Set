//
//  CardView.swift
//  Set
//
//  Created by Gregory Montilla on 12/26/20.
//

import SwiftUI

struct CardView: View {
    var shapeString: String
    var opacity: Double
    var color: Color
    var numberOfShapes: Int
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size, shape: shapeString, opacity: opacity, color: color)
        }
    }
    
    private func getShape(shape: String, opacity: Double, color: Color) -> AnyView {
        switch shape {
        case "rectangle":
            return AnyView(Rectangle()
                            .overlay(Rectangle().stroke(color,lineWidth: lineWidth))
                            .foregroundColor(color.opacity(opacity)))
        case "circle":
            return AnyView(Circle()
                            .overlay(Circle().stroke(color,lineWidth: lineWidth))
                            .foregroundColor(color.opacity(opacity)))
        default:
            return AnyView(Diamond()
                            .overlay(Diamond().stroke(color,lineWidth: lineWidth))
                            .foregroundColor(color.opacity(opacity)))
        }
    }
    
    private func body(for size: CGSize, shape: String, opacity: Double, color: Color) -> some View {
        VStack {
            ForEach(0..<numberOfShapes) { _ in
                getShape(shape: shape, opacity: opacity, color: color)
            }
        }
    }
    
    // MARK: - Drawing Constraints
    private let lineWidth: CGFloat = 3
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(shapeString: "rectangle", opacity: 1.0, color: Color.green, numberOfShapes: 2)
    }
}
