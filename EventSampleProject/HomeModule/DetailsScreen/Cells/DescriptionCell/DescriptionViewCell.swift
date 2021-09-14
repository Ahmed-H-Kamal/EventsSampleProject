//
//  DescriptionViewCell.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 14/09/2021.
//

import Foundation
import UIKit

class DescriptionViewCell: UITableViewCell, CellConfigurable{
    
    @IBOutlet weak var descriptionLabel: UILabel!
    

    var viewModel: DescriptionViewModel?
    
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? DescriptionViewModel else { return }
        self.viewModel = viewModel
        self.descriptionLabel.text = viewModel.event.eventTypeDescription

    }
    
}
