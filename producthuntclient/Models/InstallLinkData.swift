//
//  InstallLinkData.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/8/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

struct InstallLinkData: Codable {
    let id, postID: Int
    let createdAt: String
    let primaryLink: Bool
    let redirectURL: String
    let platform: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case postID = "post_id"
        case createdAt = "created_at"
        case primaryLink = "primary_link"
        case redirectURL = "redirect_url"
        case platform
    }
}
