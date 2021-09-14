//
//  DetailsScreenViewController.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 14/09/2021.
//

import Foundation
import UIKit

class DetailsScreenViewController: BaseViewController {
    lazy var controller : DetailsScreenController = {
        return DetailsScreenController()
    }()
    
    var viewModel : DetailsScreenViewModel {
        return controller.viewModel
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        self.setupBinding()
    }
    
    private func setupBinding() {
        
        self.controller.buildViewModels()

        /* observing sections */
        self.viewModel.sectionViewModels.addObserver() { [weak self] (sectionViewModels) in
            self?.tableView.reloadData()
        }
        
    }
    
    // MARK:- Register Cells
    func registerCells() {
        
        self.tableView.sectionHeaderHeight =  UITableView.automaticDimension
        self.tableView.estimatedSectionHeaderHeight = 80
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib.init(nibName: HeaderTitleViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: HeaderTitleViewCell.cellIdentifier())
        
        self.tableView.register(UINib.init(nibName: DescriptionViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: DescriptionViewCell.cellIdentifier())
        
        self.tableView.register(UINib.init(nibName: MapViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: MapViewCell.cellIdentifier())
    }

}
// MARK:- Table View Data Delegates
extension DetailsScreenViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.sectionViewModels.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionViewModel = self.viewModel.sectionViewModels.value[section]
        return sectionViewModel.rowViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionViewModel = self.viewModel.sectionViewModels.value[indexPath.section]
        let rowViewModel = sectionViewModel.rowViewModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: rowViewModel.cellIdentifier(), for: indexPath)
        
        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel)
        }
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionViewModel = viewModel.sectionViewModels.value[section]
        return CGFloat(sectionViewModel.sectionHeight)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionViewModel = self.viewModel.sectionViewModels.value[indexPath.section]
        let rowViewModel = sectionViewModel.rowViewModels[indexPath.row]
        
            switch rowViewModel {
            case is HeaderTitleViewModel:
                return 200
            case is DescriptionViewModel:
                return 200
            case is MapViewModel:
                return 200
            default:
                return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: false)
    }
}


