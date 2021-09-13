//
//  RowViewModel.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 11/09/2021.
//


import Foundation

public protocol RowViewModel {
    func cellIdentifier() -> String
}

extension RowViewModel {
    func cellIdentifier() -> String{
        return ""
    }
}

public protocol ViewModelPressible {
    func cellPressed()
}
