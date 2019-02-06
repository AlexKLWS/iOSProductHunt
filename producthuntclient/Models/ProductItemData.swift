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

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
