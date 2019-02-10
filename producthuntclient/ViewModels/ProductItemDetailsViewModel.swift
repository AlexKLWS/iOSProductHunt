//
//  ProductItemDetailsViewModel.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/8/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation
import UIKit

class ProductItemDetailsViewModel{
    
    var onErrorOccured: (() -> Void)?
    var onDataLoaded: (() -> Void)?
    
    fileprivate var productItemDetails: ProductItemDetailsData? {
        didSet {
            onDataLoaded?()
        }
    }
    
    var title = ""
    var tagline = ""
    
    func setup(data: ProductItemCellViewModel) {
        title = data.name
        tagline = data.tagline
        
        guard let networkLayer: NetworkLayerServiceProtocol = ServiceProvider.shared.getService() else { return }
        
        networkLayer.fetchDetailsForPost(withId: data.id) { [weak self] productItemDetailsData, error in
            guard error == nil else {
                self?.onErrorOccured?()
                return
            }
            
            self?.productItemDetails = productItemDetailsData
        }
    }
    
    func getImage(callback: @escaping (UIImage) -> Void) {
        guard let cache: CacheServiceProtocol = ServiceProvider.shared.getService(),
            let networkLayer: NetworkLayerServiceProtocol = ServiceProvider.shared.getService(),
            let link = productItemDetails?.screenshotURL.the300Px
            else { return }
        
        if let dataWrapper: DataWrapper = cache.getObject(forKey: link as AnyObject),
            let image = UIImage(data: dataWrapper.value) {
            callback(image)
            return
        }

        guard let url = URL(string: link) else { return }
        
        networkLayer.donwloadImageData(from: url) { data, error in
            
            cache.setObject(DataWrapper(data), forKey: link as AnyObject)
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                callback(image)
            }
        }
    }
}
