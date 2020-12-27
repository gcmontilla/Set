//
//  SetGameViewModel.swift
//  Set
//
//  Created by Gregory Montilla on 12/26/20.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    @Published private var setGame: SetGameModel = SetGameViewModel.createSetGame()
    
    private static func createSetGame() -> SetGameModel {
        let symbols = ["rectangle", "circle", "diamond"]
        let opacacities = [0.0, 0.50, 1.0]
        let colors = ["green", "red", "blue"]
        
        return SetGameModel(symbols: symbols, opacities: opacacities, colors: colors)
    }
    
    func newGame() {
        setGame = SetGameViewModel.createSetGame()
    }
    
    // MARK: - Access to the Model
    var deck: Array<SetGameModel.Card> {
        setGame.deck
    }
    
    var cards: Array<SetGameModel.Card> {
        setGame.cards
    }
    
    // MARK: - Intents
    func choose(card: SetGameModel.Card) {
        setGame.choose(card: card)
    }
    
    func addCards() {
        setGame.addCards()
    }
}

enum Symbols {
    case rectangle, circle, diamond
}
