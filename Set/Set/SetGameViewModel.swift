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
        let symbols = [Symbol.rectangle, Symbol.circle, Symbol.diamond]
        let opacacities = [0.0, 0.50, 1.0]
        let colors = [Color.green, Color.red, Color.blue]
        
        return SetGameModel(symbols: symbols, opacities: opacacities, colors: colors)
    }
    
    func newGame() {
        setGame = SetGameViewModel.createSetGame()
    }
    
    // MARK: - Access to the Model
    var deck: Array<SetGameModel.Card> {
        setGame.deck
    }
    
    var cardsOnScreen: Array<SetGameModel.Card> {
        setGame.cardsOnScreen
    }
    
    // MARK: - Intents
    func select(card: SetGameModel.Card) {
        setGame.select(card: card)
    }
    
    func getNewCards() {
        setGame.getNewCards()
    }
}
