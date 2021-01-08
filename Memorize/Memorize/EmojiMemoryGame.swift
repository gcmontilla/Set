//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Gregory Montilla on 12/19/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let themes: [(String, [String])] = [("Emojis", ["🤓", "😘", "🥺", "😀", "🤣", "😍", "🥰", "🥸", "😐", "😳", "😓"]),
                                            ("Animals", ["🐱", "🐶", "🐼", "🐸", "🐭", "🐰", "🐻", "🐨", "🐯", "🦁", "🐮"]),
                                            ("Halloween", ["💀", "👻", "🎃", "🍬", "🕷", "🕸", "🧛", "☠️", "🧟‍♂️", "🧛‍♂️", "🧛"]),
                                            ("Flags", ["🏳️", "🏴", "🏁", "🏴‍☠️", "🚩", "🏳️‍🌈", "🏳️‍⚧️", "🇺🇳", "🇺🇸", "🇦🇱", "🇧🇩"]),
                                            ("Fruits", ["🍇", "🍏", "🍎", "🫐", "🍐", "🍊", "🍋", "🍌", "🍉", "🍓", "🍒"])]
        let randomTheme = themes.randomElement()
        let themeTitle = randomTheme!.0
        var themeContent = randomTheme!.1
        themeContent.shuffle()
        let numberOfPairdsOfCards: Int = Int.random(in: 2..<5)
        
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairdsOfCards, themeTitle: themeTitle) { pairIndex in
            return themeContent[pairIndex]
        }
    }
    var themeColor: Color {
        switch model.themeTitle {
        case "Emojis":
            return Color.yellow
        case "Animals":
            return Color.blue
        case "Halloween":
            return Color.orange
        case "Flags":
            return Color.red
        case "Fruits":
            return Color.green
        default:
            return Color.white
        }
    }

    // MARK: - Access to the Model
    var score: Int {
        model.score
    }
    
    var themeTitle: String {
        model.themeTitle
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var numberOfPairsOfCards: Int {
        model.numberOfPairsOfCards
    }
    
    // MARK: - Intents(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
