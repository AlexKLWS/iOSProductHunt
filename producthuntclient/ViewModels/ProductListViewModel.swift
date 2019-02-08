//
//  ProductListViewModel.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

class ProductListViewModel {
    
    var reloadTableView: (() -> Void)?
    var onErrorOccured: (() -> Void)?
    var pushDetailController: ((ProductItemDetailViewController) -> Void)?
    
    fileprivate var cellViewModels: [ProductItemCellViewModel] = [ProductItemCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    var selectedItemIndex: IndexPath? {
        didSet {
            guard let detailController = ProductItemDetailViewController.storyboardInstance(),
                let index = selectedItemIndex else { return }
            detailController.initializeViewModel(cellViewData: getCellViewModel(at: index))
            pushDetailController?(detailController)
        }
    }
    
    var cellCount: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> ProductItemCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func loadData() {
        ActivityIndicatorView.showIndicator()
        NetworkLayer.fetchPosts { [weak self] posts, error in
            guard let this = self else { return }
            
            guard error == nil else {
                ActivityIndicatorView.hideIndicator()
                this.onErrorOccured?()
                return
            }
            
            var productItemCells: [ProductItemCellViewModel] = []
            for post in posts {
                let productItemCell = ProductItemCellViewModel(data: post)
                productItemCells.append(productItemCell)
            }
            this.cellViewModels = productItemCells
            ActivityIndicatorView.hideIndicator()
        }
    }
}
