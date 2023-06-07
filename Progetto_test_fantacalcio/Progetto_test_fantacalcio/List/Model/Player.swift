//
//  Player.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 05/06/23.
//

import Foundation

struct Player : Codable {
    var playerId: Int
    var playerName: String
    var imageURL: String
    var teamAbbreviation: String
    var averageGrade: Double
    var averageFantaGrade: Double
    var gamesPlayed: Int
}
