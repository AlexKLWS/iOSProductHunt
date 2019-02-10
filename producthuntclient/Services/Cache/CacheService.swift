//
//  CacheService.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/11/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

class CacheService: CacheServiceProtocol {
    
    fileprivate let cache = NSCache<AnyObject, AnyObject>()
    
    func getObject<T: NSObject>(forKey key: AnyObject) -> T? {
        return cache.object(forKey: key) as? T
    }
    
    func setObject<T: NSObject>(_ object: T, forKey key: AnyObject) {
        cache.setObject(object, forKey: key)
    }
}
