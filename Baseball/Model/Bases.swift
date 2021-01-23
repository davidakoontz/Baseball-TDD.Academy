//
//  Bases.swift
//  Baseball
//
//  Created by David on 1/23/21.
//

import Foundation


struct Bases {
    var firstBase: Player = EmptyPlayer()
    var secondBase: Player = EmptyPlayer()
    var thirdBase: Player = EmptyPlayer()
    var homePlate: Player = EmptyPlayer()
}

public enum BaseNames: String {
    case firstBase = "first"
    case secondBase = "second"
    case thirdBase = "third"
    case homePlate = "home"
}
