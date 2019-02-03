//
//  Session.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

class Session {
    
    fileprivate static var clientTokenData: TokenData?
    
    static var clientToken: String?
    
    class func setClientToken(_ token: TokenData) {
        clientTokenData = token
        clientToken = token.tokenType + " " + token.accessToken
    }
}
