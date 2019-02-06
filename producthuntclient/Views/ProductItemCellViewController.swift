//
//  ProductItemCellViewController.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation
import SwiftyGif
import UIKit

class ProductItemCellViewController: UITableViewCell {
    
    @IBOutlet weak var productItemThumbnail: UIImageView!
    @IBOutlet weak var productItemTitle: UILabel!
    @IBOutlet weak var productItemSubtitle: UILabel!
    
    var viewModel: ProductItemCellViewModel? {
        didSet {
            productItemTitle.text = viewModel?.name
            productItemSubtitle.text = viewModel?.tagline
            viewModel?.getImage { [weak self] image in
                self?.productItemThumbnail.stopAnimatingGif()
                SwiftyGifManager.defaultManager.deleteImageView(self!.productItemThumbnail)
                self?.productItemThumbnail.clear()
                if image.imageCount != nil {
                    self?.productItemThumbnail.setGifImage(image)
                } else {
                    self?.productItemThumbnail.image = image
                }
            }
        }
    }
}
