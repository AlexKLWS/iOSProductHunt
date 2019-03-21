//
//  MockNetworkLayerService.swift
//  producthuntclientTests
//
//  Created by Alex Korzh on 3/21/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

@testable import producthuntclient
import Foundation

class MockNetworkLayerService: NetworkLayerServiceProtocol {
    
    var fetchWasCalled = false
    var throwError = false
 
    func fetchPosts(callback: @escaping (([ProductItemData], Error?) -> Void)) {
        fetchWasCalled = true
        if throwError {
            callback([], NSError())
        }
    }
    
    func authenticate(callback: @escaping ((String, Error?) -> Void)) {
        
    }
    
    func donwloadImageData(from url: URL, callback: @escaping ((Data, Error?) -> Void)) {
        
    }
    
    func fetchDetailsForPost(withId postId: Int, callback: @escaping ((ProductItemDetailsData?, Error?) -> Void)) {
        
    }
}
