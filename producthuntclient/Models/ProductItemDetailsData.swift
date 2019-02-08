//
//  ProductItemDetailsData.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/8/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

struct ProductItemDetailsResponseData: Codable {
    let post: ProductItemDetailsData
}

struct ProductItemDetailsData: Codable {
    let commentsCount: Int
    let day: String
    let id: Int
    let name, productState, tagline: String
    let iosFeaturedAt, categoryID: JSONNull?
    let createdAt: String
    let discussionURL: String
    let exclusive: JSONNull?
    let featured, makerInside: Bool
    let makers, platforms: [JSONAny]
    let redirectURL: String
    let screenshotURL: ScreenshotURLData
    let thumbnail: ThumbnailData
    let topics: [JSONAny]
    let user: UserData
    let votesCount: Int
    let headerMediaID: JSONNull?
    let comments: [CommentData]?
    let votes, relatedLinks: [JSONAny]?
    let relatedPosts: [ProductItemDetailsData]?
    let installLinks: [InstallLinkData]?
    let media: [MediaData]?
    
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
        case makers, platforms
        case redirectURL = "redirect_url"
        case screenshotURL = "screenshot_url"
        case thumbnail, topics, user
        case votesCount = "votes_count"
        case headerMediaID = "header_media_id"
        case comments, votes
        case relatedLinks = "related_links"
        case relatedPosts = "related_posts"
        case installLinks = "install_links"
        case media
    }
}
