//
//  ProductListViewModel.swift
//  producthuntclientTests
//
//  Created by Alex Korzh on 3/21/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import XCTest
@testable import producthuntclient

class ProductListViewModelTests: XCTestCase {
    
    var sut: ProductListViewModel!
    var mockNetworkLayerService: MockNetworkLayerService!
    
    override func setUp() {
        super.setUp()
        mockNetworkLayerService = MockNetworkLayerService()
        sut = ProductListViewModel(networkLayerService: mockNetworkLayerService)
    }
    
    override func tearDown() {
        sut = nil
        mockNetworkLayerService = nil
        super.tearDown()
    }
    
    func test_load_data() {
        sut.loadData()
        
        XCTAssert(mockNetworkLayerService!.fetchWasCalled)
    }
    
    func test_load_data_error() {
        mockNetworkLayerService.throwError = true
        
        var errorCallbackGotCalled = false
        
        sut.onErrorOccured = {
            errorCallbackGotCalled = true
        }
        
        sut.loadData()
        
        XCTAssert(mockNetworkLayerService!.fetchWasCalled && errorCallbackGotCalled)
    }
}
