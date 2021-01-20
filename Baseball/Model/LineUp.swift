//
//  LineUp.swift
//  Baseball
//
//  Created by David on 1/13/21.
//

import Foundation

class LineUp {
    
    var theLineup: [Player]
    var batter = 0
    
    init() {
        theLineup = []
    }
    


    func nextBatterInLineUp() -> Player {
        if theLineup.count >= 1 {               // check for Index out of range Fatal error
            let player = theLineup[batter]
            batter += 1
            if batter >= theLineup.count {
                batter = 0
            }
            return player
        } else {
            return EmptyPlayer()
        }
    }
    
    func add(_ batter: Player) {
        theLineup.append( batter )
    }
    
    func assign(list: [Player]) {
        theLineup = list
    }
}
