//
//  ContentView.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import SwiftUI

struct ContentView: View {
    var players : [Player]

    var body: some View {

        if players.isEmpty {
            Text("No Players!")
        } else {
            List {
                Section(header: Text("Scorecard"), footer: Text("...more...")) {
                    ForEach(players) { player in
                        PlayerRowView(player: player)

                    } //forEach
                }//section
            }//list
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(players: Player.example)
    }
}
