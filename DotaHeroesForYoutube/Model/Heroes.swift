//
//  Heroes.swift
//  DotaHeroesForYoutube
//
//  Created by Serxhio Gugo on 10/21/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import Foundation

struct Heroes: Codable {
    let name: String?
    let primaryAttribute: String?
    let attackType: String?
    let img: String?
    let icon: String?
    let baseHealth: Int?
    let baseMana: Int?
    let moveSpeed: Int?
    
    private enum CodingKeys: String, CodingKey {
        case name = "localized_name"
        case primaryAttribute = "primary_attr"
        case attackType = "attack_type"
        case img, icon
        case baseHealth = "base_health"
        case baseMana = "base_mana"
        case moveSpeed = "move_speed"
    }
}
