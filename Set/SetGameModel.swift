//
//  SetGameModel.swift
//  Set
//
//  Created by Gregory Montilla on 12/26/20.
//

import Foundation

struct SetGameModel {
    private(set) var deck: Array<Card> = [Card]()
    private(set) var cards: Array<Card> = [Card]()
    private(set) var selectedCards: Array<Card> = [Card]()
    private let numberShapes: Int = 4
    private let initCards: Int = 12
    
    init(symbols: [String], opacities: [Double], colors: [String]) {
        deck = createDeck(symbols: symbols, opacities: opacities, colors: colors)
        cards = chooseInitialCards()
        selectedCards = Array<Card>()
    }
    
    private func createDeck(symbols: [String], opacities: [Double], colors: [String]) -> [Card] {
        var count = 0
        var deck = Array<Card>()
        
        for symbol in symbols {
            for opacity in opacities {
                for color in colors {
                    for number in 1..<numberShapes {
                        let card = Card(id: count, symbol: symbol, color: color, opacity: opacity, numberOfShapes: number)
                        count += 1
                        deck.append(card)
                    }
                }
            }
        }
        
        deck.shuffle()
        return deck
    }
    
    private mutating func chooseInitialCards() -> [Card] {
        var cards = Array<Card>()
        
        for _ in 0..<initCards {
            cards.append(deck.popLast()!)
        }
        
        return cards
    }
    
    mutating func addCards() {
        for _ in 0..<3 {
            if let card = deck.popLast() {
                cards.append(card)
            }
        }
    }
    
    mutating func choose(card: Card) {
        
    }
    
    struct Card: Identifiable {
        var id: Int
        var symbol: String
        var color: String
        var opacity: Double
        var numberOfShapes: Int
        var isSelected: Bool = false
        var isMatched: Bool = false
    }
}
