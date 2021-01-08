//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Gregory Montilla on 12/19/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            Text("Theme: \(viewModel.themeTitle)")
            Text("Score: \(viewModel.score)")
        }
        Grid(viewModel.cards) {card in
            CardView(card: card, color: viewModel.themeColor)
                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture(perform: {
                    withAnimation(.easeInOut(duration: 0.75)) {
                        self.viewModel.choose(card: card)
                    }
                })
                .padding(padding)
        }
        .padding()
        .foregroundColor(.orange)
        Button("New Game") {
            withAnimation(.easeInOut) {
                viewModel.newGame()
            }
        }
    }
    
    let padding: CGFloat = 5
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
