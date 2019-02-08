//
//  UserData.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/8/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

struct UserData: Codable {
    let id: Int
    let createdAt, name, username: String
    let twitterUsername, websiteURL, headline: String?
    let profileURL: String
    let imageURL: ImageURLData
    
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
