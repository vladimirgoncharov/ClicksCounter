//
//  TTIncrementModuleTests.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import XCTest
import SwinjectStoryboard
@testable import ClicksCounter

class TTIncrementModuleTests: XCTestCase, TTBaseModuleProtocol {
    
    typealias View = TTIncrementView
    
    var view: View!
    
    //MARK:-
    override func setUp() {
        super.setUp()
        self.initView()
    }
    
    override func tearDown() {
        self.view.presenter.clicksCounterService.settingsService.reset()
        self.view.presenter.clicksCounterService.storeService.dropData()
        self.deinitView()
        super.tearDown()
    }
    
    //MARK:- TTBaseModuleProtocol
    static var storyboardName: String {
        return AppStoryboard.main.name
    }
    
    static var storyboardIdentifier: String {
        return AppViews.increment.stryboardID
    }
    
    //MARK:- tests
    func testDI() {
        XCTAssertNotNil(self.view.presenter, "Presenter has been not created")
    }
    
    func testIncrement() {
        let beforeValue = self.view.presenter.clicksCount
        self.view.presenter.incrementClicksCount()
        let afterValue = self.view.presenter.clicksCount
        XCTAssert(beforeValue != afterValue, "Increment value has been not incremented")
    }
}
