//
//  ProductItemCellViewController.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation
import UIKit

class ProductItemCellViewController: UITableViewCell {
    
    @IBOutlet weak var productItemThumbnail: UIImageView!
    @IBOutlet weak var productItemTitle: UILabel!
    @IBOutlet weak var productItemSubtitle: UILabel!
    
    var viewModel: ProductItemCellViewModel? {
        didSet {
            productItemTitle.text = viewModel?.name
            productItemSubtitle.text = viewModel?.tagline
        }
    }
    
}
