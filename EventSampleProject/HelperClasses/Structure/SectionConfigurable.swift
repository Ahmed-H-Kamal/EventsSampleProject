//
//  SectionConfigurable.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 11/09/2021.
//


import Foundation
import UIKit

protocol SectionConfigurable {
    func setup(viewModel: SectionViewModel)
    static func createView(viewModel : SectionViewModel) -> UIView?
}
