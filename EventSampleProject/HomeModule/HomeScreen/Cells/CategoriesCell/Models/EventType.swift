//
//  Category.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 13/09/2021.
//

import Foundation

class EventType: Codable {
    let name: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case name
        case id
    }

    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
}
