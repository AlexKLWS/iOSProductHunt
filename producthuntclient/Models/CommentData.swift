//
//  CommentData.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/8/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

struct CommentData: Codable {
    let id: Int
    let body, createdAt: String
    let parentCommentID: JSONNull?
    let userID, subjectID, childCommentsCount: Int
    let url: String
    let postID: Int
    let subjectType: String
    let sticky: Bool
    let votes: Int
    let user: UserData
    let childComments: [JSONAny]
    let maker, hunter, liveGuest: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, body
        case createdAt = "created_at"
        case parentCommentID = "parent_comment_id"
        case userID = "user_id"
        case subjectID = "subject_id"
        case childCommentsCount = "child_comments_count"
        case url
        case postID = "post_id"
        case subjectType = "subject_type"
        case sticky, votes, user
        case childComments = "child_comments"
        case maker, hunter
        case liveGuest = "live_guest"
    }
}
