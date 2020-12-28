//
//  SetGameModel.swift
//  Set
//
//  Created by Gregory Montilla on 12/26/20.
//

import Foundation
import SwiftUI
import UIKit

struct SetGameModel {
    private(set) var deck: Array<Card> = [Card]()
    private(set) var cardsOnScreen: Array<Card> = [Card]()
    private(set) var hand: Array<Card> = [Card]()
    private let maxNumberOfSymbols: Int = 3
    private let initCards: Int = 12
    private let maxSelectedCards: Int = 3
    
    init(symbols: [Symbol], opacities: [Double], colors: [Color]) {
        deck = createDeck(symbols: symbols, opacities: opacities, colors: colors)
        cardsOnScreen = chooseInitialCards()
        hand = Array<Card>()
    }
    
    private func createDeck(symbols: [Symbol], opacities: [Double], colors: [Color]) -> [Card] {
        var count = 0
        var deck = Array<Card>()
        
        for symbol in symbols {
            for opacity in opacities {
                for color in colors {
                    for number in 1..<maxNumberOfSymbols+1 {
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
    
    mutating func getNewCards() {
        for _ in 0..<3 {
            if let card = deck.popLast() {
                cardsOnScreen.append(card)
            }
        }
    }
    
    mutating func select(card: Card) {
        if hand.count < maxSelectedCards {
            if let chosenIndex: Int = cardsOnScreen.firstIndex(matching: card) {
                // This could be a function
                cardsOnScreen[chosenIndex].isSelected = !cardsOnScreen[chosenIndex].isSelected
                if cardsOnScreen[chosenIndex].isSelected {
                    hand.append(cardsOnScreen[chosenIndex])
                } else {
                    unselect(card: cardsOnScreen[chosenIndex])
                }
            }
        }
        
        if hand.count == maxSelectedCards {
            if isHandASet() {
                removeCardsFromGame()
            } else {
                unselectCards(in: hand)
            }
        }
    }
    
    mutating func removeCardsFromGame() {
        for card in hand {
            if let removeIndex: Int = cardsOnScreen.firstIndex(matching: card) {
                cardsOnScreen.remove(at: removeIndex)
            }
        }
        hand.removeAll()
        print(hand.count)
    }
    
    mutating func unselectCards(in cards: [Card]) {
        for card in cards {
            unselect(card: card)
        }
    }
    
    mutating func unselect(card: Card) {
        if let unselectIndex: Int = cardsOnScreen.firstIndex(matching: card) {
            cardsOnScreen[unselectIndex].isSelected = false
        }
        if let removeIndex: Int = hand.firstIndex(matching: card) {
            hand.remove(at: removeIndex)
        }
    }
    
    private func isHandASet() -> Bool {
        let symbols = getSymbolsFromHand()
        let colors = getColorsFromHand()
        let numberOfShapes = getNumberOfShapesFromHand()
        
        return symbols == colors && colors == numberOfShapes
    }

    private func getSymbolsFromHand() -> Bool {
        let symbol: Symbol = hand.first!.symbol
        
        for card in hand {
            if symbol != card.symbol {
                return false
            }
        }
            
        return true
    }
    
    private func getColorsFromHand() -> Bool {
        let color: Color = hand.first!.color
        
        for card in hand {
            if color != card.color {
                return false
            }
        }
            
        return true
    }
    
    private func getNumberOfShapesFromHand() -> Bool {
        let number: Int = hand.first!.numberOfShapes
        
        for card in hand {
            if number != card.numberOfShapes {
                return false
            }
        }
        
        return true
    }
    
    struct Card: Identifiable {
        var id: Int
        var symbol: Symbol
        var color: Color
        var opacity: Double
        var numberOfShapes: Int
        var isSelected: Bool = false
        var isMatched: Bool = false
    }
}
