//
//  ProductItemCellViewModel.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation
import SwiftyGif
import UIKit

class ProductItemCellViewModel {
    
    fileprivate static let urlOptions = "auto=format&auto=compress&codec=mozjpeg&cs=strip&w=160&h=160&fit=crop"
    
    fileprivate var productItemData: ProductItemData!
    fileprivate let imageCache = NSCache<AnyObject, DataWrapper>()
    
    
    var name: String {
        return productItemData.name
    }
    
    var tagline: String {
        return productItemData.tagline
    }
    
    init (data: ProductItemData) {
        productItemData = data
    }
    
    fileprivate func isAnimatedImage(_ imageData: Data) -> Bool {
        if let source = CGImageSourceCreateWithData(imageData as CFData, nil) {
            let count = CGImageSourceGetCount(source)
            return count > 1
        }
        return false
    }
    
    func getImage(callback: @escaping (UIImage) -> Void) {
        if let dataWrapper = imageCache.object(forKey: productItemData.thumbnail.imageURL as AnyObject),
            let image = isAnimatedImage(dataWrapper.value) ?
                UIImage(gifData: dataWrapper.value) :
                UIImage(data: dataWrapper.value) {
            callback(image)
            return
        }
        
        if let placeholder = UIImage(named: "placeholder") {
            callback(placeholder)
        }
        
        var url: URL?
        if let index = productItemData.thumbnail.imageURL.firstIndex(of: "?") {
            let updatedURLString =
                productItemData.thumbnail.imageURL[productItemData.thumbnail.imageURL.startIndex...index] +
                ProductItemCellViewModel.urlOptions
            url = URL(string: String(updatedURLString))
        } else {
            url = URL(string: productItemData.thumbnail.imageURL)
        }
        guard let unwrappedURL = url else { return }
        
        NetworkLayer.donwloadImageData(from: unwrappedURL) { [weak self] data, error in
            guard let this = self, error == nil else { return }
            
            this.imageCache.setObject(DataWrapper(data), forKey: this.productItemData.thumbnail.imageURL as AnyObject)
            guard let image = this.isAnimatedImage(data) ? UIImage(gifData: data) : UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                callback(image)
            }
        }
    }
}

class DataWrapper: NSObject {
    
    let value: Data
    
    init(_ value: Data) {
        self.value = value
    }
}
