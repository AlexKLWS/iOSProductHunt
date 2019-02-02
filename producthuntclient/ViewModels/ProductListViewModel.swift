//
//  ProductListViewModel.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

class ProductListViewModel {
    
    fileprivate var reloadTableView: (()->())?
    
    fileprivate var cellViewModels: [ProductItemCellViewModel] = [ProductItemCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    var cellCount: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> ProductItemCellViewModel {
        return cellViewModels[indexPath.row]
    }
}
