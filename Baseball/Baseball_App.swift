//
//  Baseball_App.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import SwiftUI

// swiftlint:disable type_name
@main
struct Baseball_App: App {
    
    // Find our data.json in the Main App Bundle and parse it.
    //let players: [Player] = []
    //let players: [Player] = Bundle.main.decode([Player].self, from: "data.json")
    //let player = Bundle.main.decode(Player.self, from: "data.json")
 
    var game = Game(innings: Game.exampleInnings)

    
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
