//
//  HeaderTitleCell.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 14/09/2021.
//

import Foundation
import UIKit

class HeaderTitleViewCell: UITableViewCell, CellConfigurable{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    

    var viewModel: HeaderTitleViewModel?
    
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? HeaderTitleViewModel else { return }
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.event.name
        self.dateLabel.text = viewModel.event.startDate

    }
    
}
