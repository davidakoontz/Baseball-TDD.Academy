//
//  Score.swift
//  Baseball
//
//  Created by David on 1/23/21.
//

import Foundation

public struct Score {
    var visitor = 0
    var home = 0
    
    // read only computed property
    var summary: String {
        return String("\(visitor) to \(home)")
    }
    
    mutating func add(_ runs: Int, teamAtBat: Team) {
        if teamAtBat == Team.visitor {
            visitor += runs
        } else {
            home += runs
        }
    }
    

}
