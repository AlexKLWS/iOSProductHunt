//
//  ProductItemDetailsViewModel.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/8/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

class ProductItemDetailsViewModel{
    
    var title = ""
    
    func setup(data: ProductItemCellViewModel) {
        title = data.name
    }
}
