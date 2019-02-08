//
//  MediaData.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/8/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

struct MediaData: Codable {
    let id: Int
    let kindleAsin: JSONNull?
    let mediaType: String
    let priority: Int
    let platform, videoID: JSONNull?
    let originalWidth, originalHeight: Int
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case kindleAsin = "kindle_asin"
        case mediaType = "media_type"
        case priority, platform
        case videoID = "video_id"
        case originalWidth = "original_width"
        case originalHeight = "original_height"
        case imageURL = "image_url"
    }
}
