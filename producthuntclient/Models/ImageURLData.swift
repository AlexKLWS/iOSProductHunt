//
//  ImageURLData.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/8/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

struct ImageURLData: Codable {
    let the30Px, the32Px, the40Px, the44Px: String
    let the48Px, the50Px, the60Px, the64Px: String
    let the73Px, the80Px, the88Px, the96Px: String
    let the100Px, the110Px, the120Px, the132Px: String
    let the146Px, the160Px, the176Px, the220Px: String
    let the264Px, the32Px2X, the40Px2X, the44Px2X: String
    let the88Px2X, the32Px3X, the40Px3X, the44Px3X: String
    let the88Px3X, original: String
    
    enum CodingKeys: String, CodingKey {
        case the30Px = "30px"
        case the32Px = "32px"
        case the40Px = "40px"
        case the44Px = "44px"
        case the48Px = "48px"
        case the50Px = "50px"
        case the60Px = "60px"
        case the64Px = "64px"
        case the73Px = "73px"
        case the80Px = "80px"
        case the88Px = "88px"
        case the96Px = "96px"
        case the100Px = "100px"
        case the110Px = "110px"
        case the120Px = "120px"
        case the132Px = "132px"
        case the146Px = "146px"
        case the160Px = "160px"
        case the176Px = "176px"
        case the220Px = "220px"
        case the264Px = "264px"
        case the32Px2X = "32px@2X"
        case the40Px2X = "40px@2X"
        case the44Px2X = "44px@2X"
        case the88Px2X = "88px@2X"
        case the32Px3X = "32px@3X"
        case the40Px3X = "40px@3X"
        case the44Px3X = "44px@3X"
        case the88Px3X = "88px@3X"
        case original
    }
}
