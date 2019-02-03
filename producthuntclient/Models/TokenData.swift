//
//  TokenData.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

struct TokenData: Codable {
    let accessToken: String
    let createdAt: Date
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case createdAt = "created_at"
        case tokenType = "token_type"
    }
}
