//
//  SetApp.swift
//  Set
//
//  Created by Gregory Montilla on 12/26/20.
//

import SwiftUI

@main
struct SetApp: App {
    var body: some Scene {
        WindowGroup {
            var game = SetGameViewModel()
            SetGameView(setGameViewModel: game)
        }
    }
}
