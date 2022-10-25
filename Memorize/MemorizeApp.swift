//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Daniel Herrera on 7/21/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    //Want it as reference type to our ViewModel class: BirbMemoryGame
    let game = BirbMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
