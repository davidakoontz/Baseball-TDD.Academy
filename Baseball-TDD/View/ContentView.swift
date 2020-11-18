//
//  ContentView.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import SwiftUI

struct ContentView: View {
    
    // Find our data.json in the Main App Bundle and parse it.
    let players: [Player] = []
    //let players: [Player] = Bundle.main.decode([Player].self, from: "data.json")
    let player = Bundle.main.decode(Player.self, from: "data.json")
 
    var body: some View {
        //Text("some text here")
        if players.isEmpty {
            Text("No Players!")
        } else {
            ForEach(players) { player in
                PlayerRowView(player: player)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
