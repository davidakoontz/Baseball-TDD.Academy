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
        let player = theLineup[batter]
        batter += 1
        if batter >= theLineup.count {
            batter = 0
        }
        return player
        
    }
    
    func add(_ batter: Player) {
        theLineup.append( batter )
    }
}
