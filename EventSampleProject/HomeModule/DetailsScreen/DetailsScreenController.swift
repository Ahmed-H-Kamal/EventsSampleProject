//
//  DetailsScreenController.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 14/09/2021.
//

import Foundation

class DetailsScreenController: NSObject {
    let viewModel : DetailsScreenViewModel
    
    init(viewModel: DetailsScreenViewModel = DetailsScreenViewModel()) {
        self.viewModel = viewModel
    }
    
    // MARK:- Build View Models
    func buildViewModels() {
        var sectionViewModels = [SectionViewModel]()

        if let event = self.viewModel.event{
            let header = HeaderTitleViewModel(with: event)
            let section = SectionViewModel(rowViewModels: [header], sectionHeight: 0, sectionModel: nil)
            sectionViewModels.append(section)
            
            
            let rowDesc = DescriptionViewModel(with: event)
            let sectionDesc = SectionViewModel(rowViewModels: [rowDesc], sectionHeight: 0, sectionModel: nil)
            sectionViewModels.append(sectionDesc)
            
            
            let rowMap = MapViewModel(with: event)
            let sectionMap = SectionViewModel(rowViewModels: [rowMap], sectionHeight: 0, sectionModel: nil)
            sectionViewModels.append(sectionMap)
            
        }

        
        
        
        self.viewModel.sectionViewModels.value = sectionViewModels
    }
        
}
