//
//  TTIncrementUITests.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import XCTest

class TTIncrementUITests: XCTestCase, TTBaseModuleUIProtocol {
    
    var application: XCUIApplication!
    
    //MARK:- intitalization
    override func setUp() {
        super.setUp()
        
        self.runApplication(storyboardName: AppStoryboard.main.name, animationEnabled: TTLaunchEnvironmentKey.AnimationsEnabledValue.NO)
    }
    
    override func tearDown() {
        self.terminateApplication()
        
        super.tearDown()
    }
    
    //MARK: - tests
    func testIncrement() {
        self.application.buttons["IncrementButton"].tap()
    }
    
    func testGoToSettingsModuleAndBack() {
        self.application.buttons["SettingsBarItem"].tap()
        self.application.navigationBars["ClicksCounter.TTSettingsView"].buttons["КЛИКАЙ!"].tap()
    }
}
