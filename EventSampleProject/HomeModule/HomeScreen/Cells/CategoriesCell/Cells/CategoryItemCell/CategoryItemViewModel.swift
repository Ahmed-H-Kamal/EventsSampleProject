//
//  CategoryItemViewModel.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 13/09/2021.
//

import Foundation

class CategoryItemViewModel: NSObject, RowViewModel, ViewModelPressible {
    
    var title:String?

    init(title:String){
        self.title = title
    }
    
    func cellIdentifier() -> String {
        return CategoryItemViewCell.cellIdentifier()
    }
    
    func cellPressed() {
    
    }

}
