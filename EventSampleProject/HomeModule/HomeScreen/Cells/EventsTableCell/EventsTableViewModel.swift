//
//  EventsTableViewModel.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 14/09/2021.
//

import Foundation
import UIKit
class EventsTableViewModel: RowViewModel,ViewModelPressible {
    let event: Event
    var goToDetailsScreen : ((Event) -> Void)?
    
    init(with event : Event) {
        self.event = event
    }
    
    func cellIdentifier() -> String {
        return EventsTableViewCell.cellIdentifier()
    }
    func cellPressed() {
        self.goToDetailsScreen?(event)
    }
}
