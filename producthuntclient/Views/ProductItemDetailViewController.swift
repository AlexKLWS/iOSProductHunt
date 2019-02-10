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
    
    @IBOutlet weak var screenShotView: UIImageView!
    @IBOutlet weak var productTagline: UILabel!
    
    fileprivate lazy var viewModel: ProductItemDetailsViewModel = {
        return ProductItemDetailsViewModel()
    }()
    
    static func storyboardInstance() -> ProductItemDetailViewController? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController() as? ProductItemDetailViewController
    }
    
    func initializeViewModel(cellViewData: ProductItemCellViewModel) {
        viewModel.onDataLoaded = { [weak self] in
            guard let this = self else { return }
            this.navigationItem.title = this.viewModel.title
            this.productTagline.text = this.viewModel.tagline
            this.viewModel.getImage { image in
                this.screenShotView.image = image
            }
        }
        viewModel.setup(data: cellViewData)
    }
}
