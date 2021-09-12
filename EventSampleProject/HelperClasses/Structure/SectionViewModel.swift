//
//  SectionViewModel.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 11/09/2021.
//

import Foundation

public class SectionViewModel {
    var rowViewModels: [RowViewModel]
    var isEnable : Bool
    var sectionHeight : Float = 0.0
    var sectionModel : SectionModel?

    public init(rowViewModels :[RowViewModel] ,
                isEnable : Bool,
                sectionHeight : Float,
                sectionModel : SectionModel?)
    {
        self.rowViewModels = rowViewModels
        self.isEnable = isEnable
        self.sectionHeight = sectionHeight
        self.sectionModel = sectionModel
    }
}
