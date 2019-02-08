//
//  NetworkLayer.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation
import Alamofire

class NetworkLayer {
    
    class func fetchPosts(callback: @escaping (([ProductItemData], Error?) -> Void)) {
        let fetch: (String, Error?) -> Void = { token, error in
            let headers: HTTPHeaders = [
                "Authorization": token,
                "Content-Type": "application/json",
                "Accept": "application/json",
            ]
            
            AF.request("https://api.producthunt.com/v1/posts",
                       method: .get,
                       headers: headers)
                .responseData { response in
                    guard response.error == nil
                        else {
                            callback([], response.error)
                            return
                    }
                    guard let value = response.result.value
                        else {
                           callback([], NSError(domain:"", code:400, userInfo:nil))
                            return
                    }

                    let decoder = JSONDecoder()
                    do {
                        let parsedValue = try decoder.decode(ProductItemsResponseData.self, from: value)
                        callback(parsedValue.posts, nil)
                    } catch {
                        callback([], error)
                    }
            }
        }
        
        if let token = Session.clientToken {
            fetch(token, nil)
        } else {
            authenticate(callback: fetch)
        }
    }
    
    class func authenticate(callback: @escaping ((String, Error?) -> Void)) {
        guard let apiKey: String =
            ConfigurationProvider.getConfigurationValue(for: ConfigurationKeys.productHuntAPIKey),
            let secret: String =
            ConfigurationProvider.getConfigurationValue(for: ConfigurationKeys.productHuntAPISecret)
            else { return }
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Host": "api.producthunt.com"
            ]
        
        let parameters: Parameters = [
            "client_id": apiKey,
            "client_secret": secret,
            "grant_type": "client_credentials"
        ]
        
        AF.request("https://api.producthunt.com/v1/oauth/token",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseData { response in
                guard response.error == nil
                    else {
                        callback("", response.error)
                        return
                }
                guard let value = response.result.value
                    else {
                        callback("", NSError(domain:"", code:400, userInfo:nil))
                        return
                }
                
                let decoder = JSONDecoder()
                do {
                    let parsedValue = try decoder.decode(TokenData.self, from: value)
                    Session.setClientToken(parsedValue)
                    if let token = Session.clientToken {
                        callback(token, nil)
                    }
                } catch {
                    callback("", error)
                }
        }
    }
    
    class func donwloadImageData(from url: URL, callback: @escaping ((Data, Error?) -> Void)) {
        AF.download(url).responseData { response in
            guard response.error == nil
                else {
                    callback(Data(), response.error)
                    return
            }
            if let data = response.result.value {
                callback(data, nil)
            }
        }
    }
    
    class func fetchDetailsForPost(withId postId: Int, callback: @escaping ((ProductItemDetailsData?, Error?) -> Void)) {
        let fetch: (String, Error?) -> Void = { token, error in
            let headers: HTTPHeaders = [
                "Authorization": token,
                "Content-Type": "application/json",
                "Accept": "application/json",
                ]
            
            AF.request("https://api.producthunt.com/v1/posts/" + String(postId),
                       method: .get,
                       headers: headers)
                .responseData { response in
                    guard response.error == nil
                        else {
                            callback(nil, response.error)
                            return
                    }
                    guard let value = response.result.value
                        else {
                            callback(nil, NSError(domain:"", code:400, userInfo:nil))
                            return
                    }
                    
                    let decoder = JSONDecoder()
                    do {
                        let parsedValue = try decoder.decode(ProductItemDetailsResponseData.self, from: value)
                        callback(parsedValue.post, nil)
                    } catch {
                        callback(nil, error)
                    }
            }
        }
        
        if let token = Session.clientToken {
            fetch(token, nil)
        } else {
            authenticate(callback: fetch)
        }
    }
}
