//
//  TTSettingsModuleTests.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 06/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import XCTest
import SwinjectStoryboard
@testable import ClicksCounter

class TTSettingsModuleTests: XCTestCase, TTBaseModuleProtocol {
    
    typealias View = TTSettingsView
    
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
        return AppViews.settings.stryboardID
    }
    
    //MARK:- tests
    func testDI() {
        XCTAssertNotNil(self.view.presenter, "Presenter has been not created")
    }
    
    func testReset() {
        self.view.presenter.clicksCounterService.increment()
        self.view.presenter.reset()
        XCTAssert(self.view.presenter.clicksCounterService.clicksCount == TTDefaultValue.NumberOfClicks, "Increment value has been not reset")
    }
    
    func testSaveSettings() {
        let newIncrementStep = 10
        let newMaxNumberOfClicks = 100

        self.view.presenter.setIncrementStep(value: newIncrementStep)
        self.view.presenter.setMaxNumberOfClicks(value: newMaxNumberOfClicks)
        self.view.presenter.saveSettings()

        let settings = self.view.presenter.clicksCounterService.storeService.loadSettings()
        XCTAssertNotNil(settings, "Settings not loaded from store service")
        XCTAssert(settings?.incrementStep == newIncrementStep && settings?.maxNumberOfClicks == newMaxNumberOfClicks, "Settings not saved")
    }
}
