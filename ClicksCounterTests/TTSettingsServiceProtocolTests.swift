//
//  TTSettingsServiceProtocolTests.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import XCTest
import SwinjectStoryboard
@testable import ClicksCounter

class TTSettingsServiceProtocolTests: XCTestCase, TTBaseServiceProtocol {
    
    typealias ServiceType = TTSettingsServiceProtocol
    
    var service: ServiceType!
    
    //MARK:- 
    override func setUp() {
        super.setUp()
        
        self.initService()
    }
    
    override func tearDown() {
        self.service.reset()
        self.service.storeService.dropData()
        self.deinitService()
        
        super.tearDown()
    }
    
    //MARK:- tests
    func testIncrementStep() {
        self.service.incrementStep = TTMaxValue.IncrementStep + 1
        XCTAssertEqual(self.service.incrementStep, TTMaxValue.IncrementStep, "Increment step out bounds max value")
        
        self.service.incrementStep = TTMinValue.IncrementStep - 1
        XCTAssertEqual(self.service.incrementStep, TTMinValue.IncrementStep, "Increment step out bounds min value")
    }
    
    func testNumberOfClicks() {
        self.service.maxNumberOfClicks = TTMaxValue.NumberOfClicks + 1
        XCTAssertEqual(self.service.maxNumberOfClicks, TTMaxValue.NumberOfClicks, "Number of clicks out bounds max value")
        
        self.service.maxNumberOfClicks = TTMinValue.NumberOfClicks - 1
        XCTAssertEqual(self.service.maxNumberOfClicks, TTMinValue.NumberOfClicks, "Number of clicks out bounds min value")
    }
}
