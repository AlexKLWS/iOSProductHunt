//
//  CacheServiceProtocol.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/11/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

protocol CacheServiceProtocol {
    
    func getObject<T: NSObject>(forKey key: AnyObject) -> T?
    func setObject<T: NSObject>(_ object: T, forKey key: AnyObject)
    
}
