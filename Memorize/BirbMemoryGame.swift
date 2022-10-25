//
//  BirbMemoryGame.swift
//  Memorize
//
//  Created by Daniel Herrera on 8/10/22.
//

import SwiftUI

class BirbMemoryGame: ObservableObject {
    
    //Think of this as fuel
    static var cardImages = ["red1","green1","white1","yellow1", "human1", "black1", "brown1","red2","green2","white2","yellow2", "human2", "black2"]

    //This would be the fuel pump
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in cardImages[pairIndex] }
    }
    
    //This would be the ignition
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    //This allows access a read access to content on the card
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose (_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

}
