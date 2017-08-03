//
//  TTClicksCounterServiceProtocolTests.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import XCTest
import SwinjectStoryboard
@testable import ClicksCounter

class TTClicksCounterServiceProtocolTests: XCTestCase, TTBaseServiceProtocol {
    
    typealias ServiceType = TTClicksCounterServiceProtocol
    
    var service: ServiceType!
    
    //MARK:- 
    override func setUp() {
        super.setUp()
        
        self.initService()
    }
    
    override func tearDown() {
        self.service.reset()
        self.service.settingsService.reset()
        self.service.storeService.dropData()
        self.deinitService()
        
        super.tearDown()
    }
    
    //MARK:- tests
    func testIncrementByOneStep() {
        let beforeValue = self.service.clicksCount
        let incrementStep = 1
        let maxNumberOfClicks = 100
        self.service.settingsService.incrementStep = incrementStep
        self.service.settingsService.maxNumberOfClicks = maxNumberOfClicks
        self.service.increment()
        XCTAssertEqual(beforeValue + incrementStep, self.service.clicksCount, "Increment by one step is broken")
    }
    
    func testIncrementByManySteps() {
        let beforeValue = self.service.clicksCount
        let incrementStep = 10
        let maxNumberOfClicks = 100
        self.service.settingsService.incrementStep = incrementStep
        self.service.settingsService.maxNumberOfClicks = maxNumberOfClicks
        self.service.increment()
        XCTAssertEqual(beforeValue + incrementStep, self.service.clicksCount, "Increment by many steps is broken")
    }
    
    func testMaxNumberOfClicksWithMinimalInputValues() {
        let incrementStep = 1
        let maxNumberOfClicks = 1
        self.service.settingsService.incrementStep = incrementStep
        self.service.settingsService.maxNumberOfClicks = maxNumberOfClicks
        self.service.increment()
        XCTAssertEqual(1, self.service.clicksCount, "Max number is broken")
    }
    
    func testMaxNumberOfClicks() {
        let beforeValue = self.service.clicksCount
        let incrementStep = 7
        let maxNumberOfClicks = 5
        self.service.settingsService.incrementStep = incrementStep
        self.service.settingsService.maxNumberOfClicks = maxNumberOfClicks
        self.service.increment()
        XCTAssertEqual(beforeValue + 2, self.service.clicksCount, "Max number is broken")
    }
    
    func testMaxNumberOfClicksWithBigIncrementStepValue() {
        let beforeValue = self.service.clicksCount
        let incrementStep = 102
        let maxNumberOfClicks = 5
        self.service.settingsService.incrementStep = incrementStep
        self.service.settingsService.maxNumberOfClicks = maxNumberOfClicks
        self.service.increment()
        XCTAssertEqual(beforeValue + 2, self.service.clicksCount, "Max number is broken")
    }
}
