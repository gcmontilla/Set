//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Gregory Montilla on 12/19/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
