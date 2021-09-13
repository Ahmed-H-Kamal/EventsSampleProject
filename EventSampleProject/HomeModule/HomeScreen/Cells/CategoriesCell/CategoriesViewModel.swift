//
//  CategoriesViewModel.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 13/09/2021.
//

import Foundation

class CategoriesViewModel: RowViewModel {
    let isLoading = Observable<Bool>(false)
    let sectionViewModels = Observable<[SectionViewModel]>([])
    let categoriesList : [EventType]
    
    init(with categoriesList : [EventType]) {
        self.categoriesList = categoriesList
    }
    
    func cellIdentifier() -> String {
        return CategoriesViewCell.cellIdentifier()
    }
    
}
