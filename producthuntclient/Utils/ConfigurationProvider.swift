//
//  ConfigurationProvider.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/1/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

class ConfigurationProvider {
    
    fileprivate static var configuration: NSDictionary? = {
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
            return NSDictionary(contentsOfFile: path)
        } else {
            return nil
        }
    }()
    
    class func getConfigurationValue<T>(for key: String) -> T? {
        guard let configuration = configuration else { return nil }
        
        return configuration.value(forKey: key) as? T
    }
}
