//
//  ThumbnailData.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/8/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

struct ThumbnailData: Codable {
    let id: Int
    let mediaType: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case mediaType = "media_type"
        case imageURL = "image_url"
    }
}
