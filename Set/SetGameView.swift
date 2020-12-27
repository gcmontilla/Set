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
            CardView(shapeString: card.shape, opacity: card.opacity, color: getColor(of: card.color), numberOfShapes: card.numberOfShapes)iter
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
    
    func getColor(of string: String) -> Color{
        switch string {
        case "green":
            return Color.green
        case "red":
            return Color.red
        default:
            return Color.blue
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(setGameViewModel: SetGameViewModel())
    }
}
