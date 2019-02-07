//
//  ProductItemData.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

// Generated with https://quicktype.io

import Foundation

struct ProductItemsResponseData: Codable {
    let posts: [ProductItemData]
}

struct ProductItemData: Codable {
    let commentsCount: Int
    let day: String
    let id: Int
    let name, productState, tagline: String
    let iosFeaturedAt, categoryID: JSONNull?
    let createdAt: String
    let discussionURL: String
    let exclusive: JSONNull?
    let featured, makerInside: Bool
    let redirectURL: String
    let screenshotURL: ScreenshotURL
    let thumbnail: Thumbnail
    let topics: [Topic]
    let user: User
    let votesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case commentsCount = "comments_count"
        case day, id, name
        case productState = "product_state"
        case tagline
        case iosFeaturedAt = "ios_featured_at"
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

struct ScreenshotURL: Codable {
    let the300Px, the850Px: String
    
    enum CodingKeys: String, CodingKey {
        case the300Px = "300px"
        case the850Px = "850px"
    }
}

struct Thumbnail: Codable {
    let id: Int
    let mediaType: String
    let imageURL: String
    let metadata: Metadata
    
    enum CodingKeys: String, CodingKey {
        case id
        case mediaType = "media_type"
        case imageURL = "image_url"
        case metadata
    }
}

struct Metadata: Codable {
}

struct Topic: Codable {
    let id: Int
    let name, slug: String
}

struct User: Codable {
    let id: Int
    let createdAt, name, username: String
    let twitterUsername, websiteURL, headline: String?
    let profileURL: String
    let imageURL: ImageURL
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case name, username, headline
        case twitterUsername = "twitter_username"
        case websiteURL = "website_url"
        case profileURL = "profile_url"
        case imageURL = "image_url"
    }
}

struct ImageURL: Codable {
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
