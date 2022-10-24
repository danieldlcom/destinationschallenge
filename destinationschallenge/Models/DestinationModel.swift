//
//  DestinationModel.swift
//  destinationschallenge
//
//  Created by Daniel Lucas Ciríaco de Oliveira Miranda on 24/10/2022.
//

import Foundation

struct DestinationModel: Identifiable, Codable {
    var id = UUID()
    var name: String
    var subtitle: String
    var description: String
    var season: String
    
    static var defaultItem = DestinationModel(name: "UnitedKingdom", subtitle: "Winter 2022 - 3 days", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", season: "snowflake")
}
