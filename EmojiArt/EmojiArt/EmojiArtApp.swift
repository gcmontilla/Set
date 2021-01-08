//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Gregory Montilla on 1/1/21.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: EmojiArtDocument())
        }
    }
}
