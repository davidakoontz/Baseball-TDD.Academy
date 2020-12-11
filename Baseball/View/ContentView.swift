//
//  ContentView.swift
//  Baseball-TDD
//
//  Created by David on 10/4/20.
//

import SwiftUI


extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}


struct ContentView: View {
    var game: [Inning]
//    var players : [Player]

    // see: https://swiftwithmajid.com/2020/07/08/mastering-grids-in-swiftui/
    // layout of our player grid
    var columns: [GridItem] = [
        GridItem(.fixed(10)),   // left margin
        GridItem(.fixed(40), spacing: 16, alignment: .trailing),   // player number
        GridItem(.fixed(200), spacing: 16, alignment: .leading),  // name
        GridItem(.fixed(20), spacing: 16),   // position
        GridItem(.fixed(80), spacing: 16)   // diamon graphic
    ]
    
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
                    let home = game[1].top
                    Section(header: Text("Home Team" + "- inning #\(game[1].number)").font(.title2)) {
                        ForEach(home) { player in
                            Spacer()
                            Text("#\(player.number)")
                            Text(player.name)
                            Text(player.position)
                            Text(player.atBat)
//                            BallField()
//                                .stroke(Color.blue, lineWidth: 1)
//                                .frame(width: 10, height: 10)
                        }
                    }
                    let visitors = game[1].bottom
                    Section(header: Text("Visiting Team" + "- inning #\(game[1].number)").font(.title2)) {
                        ForEach(visitors) { player in
                            Spacer()
                            Text("#\(player.number)")
                            Text(player.name)
                            Text(player.position)
                            Text(player.atBat)
//                            BallField()
//                                .stroke(Color.blue, lineWidth: 1)
//                                .frame(width: 10, height: 10)
                        }
                    }
                
                }
            }
            
            
            
            
            
            /* original code
            List {
                Section(header: Text("Scorecard"), footer: Text("...more...")) {
                    ForEach(players) { player in
                        PlayerRowView(player: player)

                    } //forEach
                }//section
            }//list
            .listStyle(GroupedListStyle())
            */
        } // if else
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        //ContentView(players: Player.example)
        ContentView(game: Inning.exampleGame)
    }
}
