//
//  RunnerOutcomes.swift
//  Baseball
//
//  Created by David on 1/23/21.
//

import Foundation

/// runner outcomes are displayed on the baseLines (between bases) - there are 4 lines
struct RunnerOutcomes {
    var firstBaseLine : [AtBat] = [.blank]               // from batter's box (arround home plate) to first
    var secondBaseLine: [RunnerActions] = [.blank]      // from first to second
    var thirdBaseLine : [RunnerActions] = [.blank]      // from second to third
    var homeBaseLine  : [RunnerActions] = [.blank]       // from thrid to home plate
    
    mutating func add(_ base: BaseNames, action: RunnerActions) {
        switch base {
        case BaseNames.batter:
            //firstBaseLine.append(action) // type conflict AtBat is not a RunnerActions
            if 1 == 1 { /* do nothing  */ }  // FIXME: empyt case BaseNames.batter
        case BaseNames.firstBase:
            secondBaseLine.append(action)
        case BaseNames.secondBase:
            thirdBaseLine.append(action)
        case BaseNames.thirdBase:
            homeBaseLine.append(action)
        case BaseNames.homePlate:
            if 1 == 1 { /* do nothing  */ }  // FIXME: empyt case BaseNames.batter
        }
    }
}
