//
//  Array+Shape.swift
//  Set
//
//  Created by Gregory Montilla on 12/27/20.
//

import Foundation
import SwiftUI

extension Array where Element: Shape {
    func matchingShapes() -> Bool {
        let shape = type(of: first)
        
        for index in 0..<self.count {
            if type(of: self[index]) != shape {
                return false
            }
        }
        
        return true
    }
}
