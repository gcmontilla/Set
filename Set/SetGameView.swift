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
        Grid(setGameViewModel.cardsOnScreen) { card in
            CardView(card: card)
                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture(perform: {
                    setGameViewModel.select(card: card)
                })
        }
        HStack {
            Button("New Game") { setGameViewModel.newGame() }
            if setGameViewModel.deck.count != 0 {
                Button("Add Cards") { setGameViewModel.getNewCards() }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(setGameViewModel: SetGameViewModel())
    }
}
