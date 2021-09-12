//
//  CellConfigurable.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 11/09/2021.
//

import Foundation

@objc protocol CellConfigurable {
    func setup(viewModel: RowViewModel)
}
