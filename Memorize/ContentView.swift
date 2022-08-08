//
//  ContentView.swift
//  Memorize
//
//  Created by Daniel Herrera on 7/21/22.
//

import SwiftUI

struct ContentView: View {
    var cardImages = ["red1","green1","white1","yellow1", "human1", "black1", "brown1","red2","green2","white2","yellow2", "human2", "black2"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            HStack {
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()]) {
                    ForEach(cardImages[0..<cardCount], id: \.self) { cardImage in
                        CardView(content: cardImage).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            
            //Button View
            HStack {
                removeButton
                Spacer()
                addButton
            }
            .padding(.horizontal)
            .font(.largeTitle)
            .foregroundColor(.blue)
        }
        .padding(.horizontal)
    }
    
    var addButton: some View {
        Button {
            if cardCount < cardImages.count {
            cardCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var removeButton: some View {
        Button {
            if cardCount > 1 {
                cardCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

//This will create the "card" for our game
struct CardView: View {
    
    var content: String
    
    @State var isFacedUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            //Views for front and back of CardView
            //Front CardView
            if isFacedUp {
                
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)

                
                //Imported Images
                Image (content)
                    .resizable()
                    .scaledToFit()
                    .padding(5.0)
            }
            
            //Back CardView
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFacedUp = !isFacedUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portraitUpsideDown)
        /*ContentView()
            .previewInterfaceOrientation(.landscapeRight)
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
         */
    }
}
