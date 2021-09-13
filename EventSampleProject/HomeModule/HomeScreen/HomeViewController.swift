//
//  HomeViewController.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 12/09/2021.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    lazy var controller : HomeController = {
        return HomeController()
    }()
    
    var viewModel : HomeViewModel {
        return controller.viewModel
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        self.setupBinding()
        self.getCategoriesType()
    }
    
    private func setupBinding() {
        
        /* observing sections */
        self.viewModel.sectionViewModels.addObserver() { [weak self] (sectionViewModels) in
            self?.tableView.reloadData()
        }
        
        self.viewModel.isLoading.addObserver { (isLoading) in
            if isLoading {
                appLoader().showLoading()
            } else {
                appLoader().hideLoading()
            }
        }
        
        self.viewModel.categoriesList.addObserver() { [weak self] (categories) in
            self?.controller.buildViewModels()
        }
    }
    
    // MARK:- Register Cells
    func registerCells() {
        
        self.tableView.sectionHeaderHeight =  UITableView.automaticDimension
        self.tableView.estimatedSectionHeaderHeight = 80
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib.init(nibName: CategoriesViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: CategoriesViewCell.cellIdentifier())
        
    }
    
    func getCategoriesType() {
        self.viewModel.isLoading.value = true
        self.viewModel.getCategories() { (response, error) in
            if error == nil{
                self.viewModel.categoriesList.value = response!
                self.viewModel.isLoading.value = false
            }
        }
    }

}
// MARK:- Table View Data Delegates
extension HomeViewController: UITableViewDelegate, UITableViewDataSource
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
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: false)
    }
}


