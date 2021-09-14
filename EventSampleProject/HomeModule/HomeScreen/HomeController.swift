//
//  HomeController.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 12/09/2021.
//

import Foundation
class HomeController: NSObject {
    let viewModel : HomeViewModel
    
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
    }
    
    // MARK:- Build View Models
    func buildViewModels() {
        var sectionViewModels = [SectionViewModel]()

        let row_categories = CategoriesViewModel(with: self.viewModel.categoriesList.value, selectedId: self.viewModel.selectedId ?? "")
        row_categories.didSelectCategory = { (id) in
            self.viewModel.didSelectCategory?(id)
            self.viewModel.selectedId = id
        }
        let section_categories = SectionViewModel(rowViewModels: [row_categories], sectionHeight: 0, sectionModel: nil)
        sectionViewModels.append(section_categories)
        
        
        let section_events = SectionViewModel(rowViewModels: getEventsByCategoryViewModels(), sectionHeight: 0, sectionModel: nil)
        sectionViewModels.append(section_events)
        
        self.viewModel.sectionViewModels.value = sectionViewModels
    }
    
    func getEventsByCategoryViewModels() -> [RowViewModel] {
        var listOfEvents = [RowViewModel]()
        
        for event in self.viewModel.eventsByCategory.value {
            let model = EventsTableViewModel(with: event)
            model.goToDetailsScreen = { event in
                self.viewModel.didSelectEvent?(event)
            }
            listOfEvents.append(model)
        }
        return listOfEvents
    }
    
}
