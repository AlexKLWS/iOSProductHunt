//
//  ProductItemData.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

struct ProductItemData: Codable {
    let commentsCount: Int
    let id: Int
    let name: String
    let productState: String
    let tagline: String
    let createdAt: Date
    let discussionUrl: URL
    let isFeatured: Bool
    let redirectUrl: URL
    let screenshotUrl: [String: URL]
    let thumbnail: PorductItemThumbnailData
    let topics: [ProductItemTopicData]
    let user: ProductItemUserData
    let votesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case commentsCount = "comments_count"
        case id
        case name
        case productState = "product_state"
        case tagline
        case createdAt = "created_at"
        case discussionUrl = "discussion_url"
        case isFeatured = "featured"
        case redirectUrl = "redirect_url"
        case screenshotUrl = "screenshot_url"
        case thumbnail
        case topics
        case user
        case votesCount = "votes_count"
    }
}

struct PorductItemThumbnailData: Codable {
    let id: Int
    let mediaType: String
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case mediaType = "media_type"
        case imageURL = "image_url"
    }
}

struct ProductItemTopicData: Codable {
    let id: Int
    let name: String
    let slug: String
}

struct ProductItemUserData: Codable {
    let id: Int
    let name: String
    let username: String
    let headline: String
    let imageURL: [String: URL]
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case username
        case headline
        case imageURL = "image_url"
    }
}

struct ProductItemsResponseData: Codable {
    let posts: [ProductItemData]
}
