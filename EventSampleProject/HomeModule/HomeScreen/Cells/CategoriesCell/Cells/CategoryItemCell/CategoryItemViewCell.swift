//
//  CategoryItemViewCell.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 13/09/2021.
//

import Foundation
import UIKit

class CategoryItemViewCell: UICollectionViewCell, CellConfigurable {
    
    var viewModel: CategoryItemViewModel?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewBottom: UIView!

    // MARK:- configuration
    func setup(viewModel: RowViewModel) {
        if let viewModel = viewModel as? CategoryItemViewModel{
            if let title = viewModel.title{
                self.configure(with: title, isSelected: viewModel.isSelected ?? false)
            }
        }
    }
    
    func configure(with title:String, isSelected:Bool = false) {
        self.titleLabel.text = title
        self.isSelected = isSelected
    }

    override var isSelected: Bool {
        didSet {
            self.contentView.backgroundColor = isSelected ? UIColor.init(hexString: "00796b") : UIColor.lightGray
            self.titleLabel.textColor = isSelected ? UIColor.white : UIColor.black
            self.viewBottom.isHidden = !isSelected
        }
    }
    
    
    

}

