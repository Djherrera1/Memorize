//
//  Memory.swift
//  Memorize
//
//  Created by Daniel Herrera on 8/10/22.
//

import Foundation

//Generic Type here will be mutated to Strings that refers to the image
struct MemoryGame<CardContent> where CardContent: Equatable {
    private (set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFacedUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFacedUp,
            !cards[chosenIndex].isMatcheded
        {
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFacedUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatcheded = true
                    cards[potentialMatchIndex].isMatcheded = true
                }
                indexOfTheOneAndOnlyFacedUpCard = nil;
            } else {
                for index in cards.indices {
                    cards[index].isFacedUp = false
                }
                indexOfTheOneAndOnlyFacedUpCard = chosenIndex
            }
            cards[chosenIndex].isFacedUp.toggle()
        }
        
        
        print("isFaceUp: \(cards)")
    }
    
    //Creates a pair of cards and stores them into an array
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    //Struct will handle Images of the cards and their status
    struct Card: Identifiable {
        
        var isFacedUp: Bool = false
        var isMatcheded: Bool = false
        var content: CardContent
        var id: Int
    }
}
