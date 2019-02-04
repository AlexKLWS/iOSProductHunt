//
//  ProductItemCellViewModel.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

class ProductItemCellViewModel {
    
    fileprivate var productItemData: ProductItemData!
    
    var name: String {
        return productItemData.name
    }
    
    var tagline: String {
        return productItemData.tagline
    }
    
    init (data: ProductItemData) {
        productItemData = data
    }
}
