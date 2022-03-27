//
//  Tech.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 27.03.2022.
//

import Foundation

struct Tech: Codable {
    let id: Int
    let name: String
    let description: String
    let expansion: String
    let age: String
    let developsIn: String
    let cost: Cost
    let buildTime: Float
    let appliesTo: [String]
}
