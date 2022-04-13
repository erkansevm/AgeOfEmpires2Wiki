//
//  Civilization.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 24.02.2022.
//

import Foundation

struct Civilization: Codable, ModelGeneral {
    let id: Int
    let name: String
    let expansion: String
    let army_type: String
    let unique_unit: [String]
    let unique_tech: [String]
    let team_bonus: String
    let civilization_bonus: [String]
}

