//
//  Symbol.swift
//  Set
//
//  Created by Gregory Montilla on 12/27/20.
//

import Foundation
import SwiftUI

enum Symbol {
    case rectangle, circle, diamond
}

func getSymbol(from symbol: Symbol) -> some Shape {
    let cornerRadius: CGFloat = 5
    
    switch symbol {
    case .rectangle:
        return AnyShape(RoundedRectangle(cornerRadius: cornerRadius))
    case .circle:
        return AnyShape(Circle())
    case .diamond:
        return AnyShape(Diamond())
    }
}
