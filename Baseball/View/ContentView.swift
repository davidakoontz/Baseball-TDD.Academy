//
//  ContentView.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import SwiftUI

struct ContentView: View {
    var game: [Inning]
//    var players : [Player]

    // see: https://swiftwithmajid.com/2020/07/08/mastering-grids-in-swiftui/
    // layout of our player grid
    var columns: [GridItem] = [
        GridItem(.fixed(10)),   // left margin
        GridItem(.fixed(40), spacing: 16, alignment: .trailing),   // player number
        GridItem(.fixed(200), spacing: 16, alignment: .leading),  // name
        GridItem(.fixed(20), spacing: 16)   // position
        //GridItem(.fixed(80), spacing: 16)   // atBat
    ]
    
    //swiftlint:disable large_tuple
    fileprivate func playerRowView(atBats: [Play])
        -> ForEach<[Play], String, TupleView<(Spacer, Text, Text, Text)>> {
        return ForEach(atBats) { play in
            Spacer()
            Text("#\(play.batter.number)")
            Text(play.batter.name)
            Text(play.batter.position.rawValue)

        }
    }
    
    var body: some View {
        
        if game.isEmpty {
            Text("No Players!")
        } else {
            ScrollView {
                LazyVGrid(columns: columns,
                          alignment: .center,
                          spacing: 16,
                          pinnedViews: [.sectionHeaders, .sectionFooters]
                ) {
                    
                    let visitorsPlayers = game[0].top
                    Section(header: Text("Visiting Team" + " - inning #\(game[0].number)").font(.title2)) {
                        playerRowView(atBats: visitorsPlayers)
                    }
                    
                    let homeTeamPlayers = game[0].bottom
                    Section(header: Text("Home Team" + " - inning #\(game[0].number)").font(.title2)) {
                        playerRowView(atBats: homeTeamPlayers)
                    }
                    
                }
            }
        } // if else
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        //ContentView(players: Player.example)
        ContentView(game: Inning.exampleGame)
    }
}
