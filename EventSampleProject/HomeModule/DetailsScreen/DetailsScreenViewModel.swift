//
//  DetailsScreenViewModel.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 14/09/2021.
//

import Foundation

class DetailsScreenViewModel: NSObject {
    let sectionViewModels = Observable<[SectionViewModel]>([])
    var event: Event?
}
