//
//  CategoryItemViewModel.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 13/09/2021.
//

import Foundation

class CategoryItemViewModel: NSObject, RowViewModel, ViewModelPressible {
    
    var title:String?
    var id:String?
    var isSelected:Bool? = false

    init(title:String){
        self.title = title
    }
    
    init(title:String,
         id : String,
         isSelected: Bool){
        self.title = title
        self.id = id
        self.isSelected = isSelected
    }
    
    func cellIdentifier() -> String {
        return CategoryItemViewCell.cellIdentifier()
    }
    
    func cellPressed() {
    
    }

}
