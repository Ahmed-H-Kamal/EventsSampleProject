//
//  EventsTableViewCell.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 14/09/2021.
//

import Foundation
import UIKit
import SDWebImage

class EventsTableViewCell: UITableViewCell, CellConfigurable{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var eventImage: UIImageView!

    var viewModel: EventsTableViewModel?
    
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? EventsTableViewModel else { return }
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.event.name
        self.subTitleLabel.text = viewModel.event.eventTypeDescription
        self.dateLabel.text = viewModel.event.startDate

        if let cover = viewModel.event.cover{
            self.eventImage.sd_setImage(with: URL(string: cover))
        }

        
    }
    
}
