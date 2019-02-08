//
//  ProductItemDetailViewController.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/7/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation
import UIKit

class ProductItemDetailViewController: UIViewController {
    
    fileprivate lazy var viewModel: ProductItemDetailsViewModel = {
        return ProductItemDetailsViewModel()
    }()
    
    static func storyboardInstance() -> ProductItemDetailViewController? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController() as? ProductItemDetailViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.title
    }
    
    func initializeViewModel(cellViewData: ProductItemCellViewModel) {
        viewModel.setup(data: cellViewData)
    }
}
