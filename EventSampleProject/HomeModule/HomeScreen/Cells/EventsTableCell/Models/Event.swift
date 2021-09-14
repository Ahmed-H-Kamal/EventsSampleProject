//
//  Event.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 14/09/2021.
//

import Foundation

class Event: Codable {
    let longitude: String?
    let latitude: String?
    let endDate: String?
    let startDate: String?
    let eventTypeDescription: String?
    let cover: String?
    let name: String?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case longitude = "longitude"
        case latitude = "latitude"
        case endDate = "end_date"
        case startDate = "start_date"
        case eventTypeDescription = "description"
        case cover = "cover"
        case name = "name"
        case id = "id"
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
