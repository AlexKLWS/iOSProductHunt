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
    
    //Client-level token doesn't expire so logic here is pretty simple
    static var clientToken = UserDefaults.standard.string(forKey: "client_token")
    
    class func setClientToken(_ token: TokenData) {
        clientTokenData = token
        clientToken = token.tokenType + " " + token.accessToken
        UserDefaults.standard.set(clientToken, forKey: "client_token")
    }
}
