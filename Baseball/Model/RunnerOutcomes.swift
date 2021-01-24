//
//  RunnerOutcomes.swift
//  Baseball
//
//  Created by David on 1/23/21.
//

import Foundation

/// runner outcomes are displayed on the baseLines (between bases) - there are 4 lines
struct RunnerOutcomes {
    var firstBaseLine: AtBat = .blank               // from batter's box (arround home plate) to first
    var secondBaseLine: RunnerActions = .blank      // from first to second
    var thirdBaseLine: RunnerActions = .blank       // from second to third
    var homeBaseLine: RunnerActions = .blank        // from thrid to home plate
}
