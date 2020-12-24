//
//  Game.swift
//  Baseball
//
//  Created by David on 12/23/20.
//

import Foundation

public class Game {
    private var innings: [Inning] = []
    
    func append(inning: Inning) {
        innings.append(inning)
    }
    
    func inningCount() -> Int {
        return innings.count
    }
}
