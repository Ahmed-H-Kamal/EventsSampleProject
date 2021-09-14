//
//  EventsTableViewModel.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 14/09/2021.
//

import Foundation

class EventsTableViewModel: RowViewModel {
    let event: Event
    
    init(with event : Event) {
        self.event = event
    }
    
    func cellIdentifier() -> String {
        return EventsTableViewCell.cellIdentifier()
    }
    
}
