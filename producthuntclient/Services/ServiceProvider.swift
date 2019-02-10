//
//  ServiceProvider.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/11/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

class ServiceProvider {
    
    static let shared: ServiceProvider = ServiceProvider()
    
    fileprivate let services: Array<AnyObject> =
        [NetworkLayerService(), CacheService()]
    
    func getService<T>() -> T? {
        for service in services {
            if let requestedService = service as? T {
                return requestedService
            }
        }
        return nil
    }
}
