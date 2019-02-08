//
//  ScreenshotURLData.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/8/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

struct ScreenshotURLData: Codable {
    let the300Px, the850Px: String
    
    enum CodingKeys: String, CodingKey {
        case the300Px = "300px"
        case the850Px = "850px"
    }
}
