//
//  DataWrapper.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/11/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

class DataWrapper: NSObject {
    
    let value: Data
    
    init(_ value: Data) {
        self.value = value
    }
}
