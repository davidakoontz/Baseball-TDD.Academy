//
//  Baseball_App.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import SwiftUI

@main
struct Baseball_App: App {
    
    // Find our data.json in the Main App Bundle and parse it.
    //let players: [Player] = []
    //let players: [Player] = Bundle.main.decode([Player].self, from: "data.json")
    //let player = Bundle.main.decode(Player.self, from: "data.json")
 
    var body: some Scene {
        WindowGroup {
            ContentView(players: Player.example)
        }
    }
}
