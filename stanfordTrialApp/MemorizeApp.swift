//
//  MemorizeApp.swift
//  stanfordTrialApp
//
//  Created by Yashavika Singh on 21.05.24.
//
import SwiftUI

@main
struct MemorizeApp: App {
    
    private let emojiGame = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView()
        }
    }
}
