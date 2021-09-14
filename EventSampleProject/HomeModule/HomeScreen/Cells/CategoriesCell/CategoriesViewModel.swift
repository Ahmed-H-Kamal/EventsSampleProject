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
    var didSelectCategory : ((String) -> Void)?
    var selectedId : String?

    init(with categoriesList : [EventType]) {
        self.categoriesList = categoriesList
    }
    
    init(with categoriesList : [EventType], selectedId: String) {
        self.categoriesList = categoriesList
        self.selectedId = selectedId
    }
    
    func cellIdentifier() -> String {
        return CategoriesViewCell.cellIdentifier()
    }
    
}
