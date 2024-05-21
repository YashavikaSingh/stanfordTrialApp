//
//  MemoryGame.swift
//  stanfordTrialApp
//
//  Created by Yashavika Singh on 17.05.24.
//


import Foundation
struct MemoryGame<CardContent> {
    private (set) var cards: Array<Card>
    
    init (numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add number of pairs of cards times two cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    
    func choose (_ card: Card)
    {
    }
    
    struct Card{
        var isFaceUp = false
        var isMatched = false
        let content : CardContent
    }
    
}
