//
//  ProductItemData.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

// Generated with https://quicktype.io

struct ProductItemsResponseData: Codable {
    let posts: [ProductItemData]
}

struct ProductItemData: Codable {
    let commentsCount: Int
    let day: String
    let id: Int
    let name, productState, tagline: String
    let categoryID: JSONNull?
    let createdAt: String
    let discussionURL: String
    let exclusive: JSONNull?
    let featured, makerInside: Bool
    let redirectURL: String
    let screenshotURL: ScreenshotURLData
    let thumbnail: ThumbnailData
    let topics: [TopicData]
    let user: UserData
    let votesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case commentsCount = "comments_count"
        case day, id, name
        case productState = "product_state"
        case tagline
        case categoryID = "category_id"
        case createdAt = "created_at"
        case discussionURL = "discussion_url"
        case exclusive, featured
        case makerInside = "maker_inside"
        case redirectURL = "redirect_url"
        case screenshotURL = "screenshot_url"
        case thumbnail, topics, user
        case votesCount = "votes_count"
    }
}
