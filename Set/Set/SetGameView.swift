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
                .aspectRatio(dimensions, contentMode: .fill)
                .onTapGesture(perform: {
                    setGameViewModel.select(card: card)
                })
                .padding()
        }
        .padding()
        buttons
    }
    
    var buttons: some View {
        HStack {
            Spacer()
            Button("New Game") { setGameViewModel.newGame() }
            Spacer()
            Button("Add Cards") { setGameViewModel.getNewCards() }
                .disabled(setGameViewModel.deck.count == 0)
            Spacer()
        }
    }
    
    // MARK: - Drawing Constraints
    private let dimensions: CGSize = CGSize(width: 2.0, height: 3.0)
    private let padding: CGFloat = 5.0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(setGameViewModel: SetGameViewModel())
    }
}
