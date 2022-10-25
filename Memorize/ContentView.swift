//
//  ContentView.swift
//  Memorize
//
//  Created by Daniel Herrera on 7/21/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: BirbMemoryGame
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

//This will create the "card" for our game
struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            //Views for front and back of CardView
            //Front CardView
            if card.isFacedUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                
                //Imported Images
                Image (card.content)
                    .resizable()
                    .scaledToFit()
                    .padding(5.0)
            } else if card.isMatcheded {
                shape.opacity(0)
            }
            //Back CardView
            else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game  = BirbMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portraitUpsideDown)
        /*ContentView()
            .previewInterfaceOrientation(.landscapeRight)
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
         */
    }
}
