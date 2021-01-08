//
//  Array+Only.swift
//  Memorize
//
//  Created by Gregory Montilla on 12/21/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
