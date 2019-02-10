//
//  NetworkLayerServiceProtocol.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/11/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation

protocol NetworkLayerServiceProtocol {
    
    func fetchPosts(callback: @escaping (([ProductItemData], Error?) -> Void))
    func authenticate(callback: @escaping ((String, Error?) -> Void))
    func donwloadImageData(from url: URL, callback: @escaping ((Data, Error?) -> Void))
    func fetchDetailsForPost(withId postId: Int, callback: @escaping ((ProductItemDetailsData?, Error?) -> Void))
    
}
