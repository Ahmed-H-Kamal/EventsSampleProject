//
//  CategoriesViewCell.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 13/09/2021.
//

import Foundation
import UIKit
class CategoriesViewCell: UITableViewCell, CellConfigurable{
    
    var viewModel: CategoriesViewModel?
        
    @IBOutlet weak var collectionView: UICollectionView!
    
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? CategoriesViewModel else { return }
        self.viewModel = viewModel
        
        collectionView.register(UINib(nibName: "CategoryItemViewCell", bundle: nil), forCellWithReuseIdentifier: CategoryItemViewCell.cellIdentifier())
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
}


extension CategoriesViewCell : UICollectionViewDelegate, UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.viewModel?.categoriesList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryItemViewCell.cellIdentifier(), for: indexPath) as! CategoryItemViewCell
        
        let rowViewModel = CategoryItemViewModel(title: self.viewModel?.categoriesList[indexPath.row].name ?? "")
        
        cell.setup(viewModel: rowViewModel)

        return cell
    
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let id = self.viewModel?.categoriesList[indexPath.row].id{
            self.viewModel?.didSelectCategory?(id)
        }
    }

    
}
