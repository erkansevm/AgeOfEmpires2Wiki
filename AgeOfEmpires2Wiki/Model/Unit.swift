//
//  Unit.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 7.03.2022.
//

import Foundation

struct Unit: Codable, ModelGeneral {
    let id: Int
    let name: String
    let description: String
    let expansion: String
    let age: String
    let createdIn: String
    let cost: Cost
    let buildTime: Float?
    let reloadTime: Float?
    let attackDelay: Float?
    let movementRate: Float?
    let lineOfSight: Float?
    let hitPoints: Float?
    let range: Int?
    let attack: Int?
    let armor: String?
    let attackBonus: [String]?
    let armorBonus: [String]?
    let searchRadius: Float?
    let accuracy: String?
    let blastRadius: Float?
    
}

struct Cost: Codable {
    let wood: Int?
    let food: Int?
    let gold: Int?
    let stone: Int?
    
    enum CodingKeys: String, CodingKey {
        case wood = "Wood"
        case food = "Food"
        case gold = "Gold"
        case stone = "Stone"
    }
}
