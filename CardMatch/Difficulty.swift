//
//  Difficulty.swift
//  CardMatch
//
//  Created by Kyle on 8/29/20.
//  Copyright © 2020 Kyle. All rights reserved.
//

import Foundation

enum Difficulty: Int, CaseIterable {
    case easy = 4 // This raw value is the number of cards in the game. The pairs are half of that.
    case medium = 8
    case hard = 12
}
