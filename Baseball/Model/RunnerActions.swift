//
//  RunnerActions.swift
//  Baseball
//
//  Created by David on 1/23/21.
//

import Foundation

enum RunnerActions: String {
    case blank = "_"                // an empty or blank runner action
    case advances = "AB"            // with a batter number e.g. AB4 = Advanced by Batter #4 in line up
    case advances2 = "2xAB"         // Advanced 2 bases by Batter X
    case advances3 = "3xAB"         // Advances 3 bases by Batter X
    case caughtStealing = "CS"
    case stolenBase = "SB"          // Stolen Base by runner
    case baseIsHeld = "H"           // runner is held on base
    case scores = "SCORES"
    case doublePlay = "DP"
    case triplePlay = "TP"
}
