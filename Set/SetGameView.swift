//
//  ContentView.swift
//  Set
//
//  Created by Gregory Montilla on 12/26/20.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var setGameViewModel: SetGameViewModel
    
    var body: some View {
        Grid(setGameViewModel.cards) { card in
            CardView(card: card)
                .padding()
        }
        .padding()
        HStack {
            Button("New Game") { setGameViewModel.newGame() }
            if setGameViewModel.deck.count != 0 {
                Button("Add Cards") { setGameViewModel.addCards() }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(setGameViewModel: SetGameViewModel())
    }
}
