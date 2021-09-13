//
//  Event.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 14/09/2021.
//

import Foundation

class Event: Codable {
    let longitude: String
    let latitude: String
    let endDate: String
    let startDate: String
    let eventTypeDescription: String
    let cover: String
    let name: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case longitude
        case latitude
        case endDate
        case startDate
        case eventTypeDescription
        case cover
        case name
        case id
    }

    init(longitude: String, latitude: String, endDate: String, startDate: String, eventTypeDescription: String, cover: String, name: String, id: String) {
        self.longitude = longitude
        self.latitude = latitude
        self.endDate = endDate
        self.startDate = startDate
        self.eventTypeDescription = eventTypeDescription
        self.cover = cover
        self.name = name
        self.id = id
    }
}
