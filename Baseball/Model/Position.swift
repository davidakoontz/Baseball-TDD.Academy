//
//  Position.swift
//  Baseball
//
//  Created by David on 1/23/21.
//

import Foundation

public enum Position: String, CaseIterable {
    case pitcher          = "1"
    case catcher          = "2"
    case firstBase        = "3"
    case secondBase       = "4"
    case thirdBase        = "5"
    case shortStop        = "6"
    case leftField        = "7"
    case centerField      = "8"
    case rightField       = "9"
    case extraOutfielder  = "10"     // only in Softball - not in baseball
    case designatedHitter = "DH"    // a batter but doesn't go onto the field - bats instead of pitcher
}
