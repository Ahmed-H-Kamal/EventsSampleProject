//
//  RowViewModel.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 11/09/2021.
//


import Foundation

@objc public protocol RowViewModel {
    func cellIdentifier() -> String
}

public protocol ViewModelPressible {
    func cellPressed()
}
