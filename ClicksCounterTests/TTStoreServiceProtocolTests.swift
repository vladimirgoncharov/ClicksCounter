//
//  TTStoreServiceProtocolTests.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import XCTest
import SwinjectStoryboard
@testable import ClicksCounter

class TTStoreServiceProtocolTests: XCTestCase, TTBaseServiceProtocol {
    
    typealias ServiceType = TTStoreServiceProtocol
    
    var service: ServiceType!
    
    //MARK:- 
    override func setUp() {
        super.setUp()
        
        self.initService()
    }
    
    override func tearDown() {
        self.service.dropData()
        self.deinitService()
        
        super.tearDown()
    }
    
    //MARK:- tests
    func testSaveAndLoadNumberOfClicks() {
        let numberOfClicks = Int(arc4random_uniform(10) + 1)   //getting random value from 1 to 10
        do {
            try self.service.save(numberOfClicks: numberOfClicks)
            XCTAssertEqual(numberOfClicks, self.service.loadNumberOfClicks(), "Saved number of clicks not equal loaded value")
        } catch let error {
            XCTAssert(false, "\(error)")
        }
    }
    
    func testSaveAndLoadSettings() {
        //getting random value from 1 to 10
        let newSettings = TTSettings()
        newSettings.incrementStep = Int(arc4random_uniform(10) + 1)  //getting random value from 1 to 10
        newSettings.maxNumberOfClicks = Int(arc4random_uniform(100) + 100)  //getting random value from 100 to 200
        do {
            try self.service.save(settings: newSettings)
            XCTAssertEqual(newSettings, self.service.loadSettings(), "Saved settings not equal loaded value")
        } catch let error {
            XCTAssert(false, "\(error)")
        }
    }
}
