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
        let button = self.application.buttons["IncrementButton"]
        let value = button.label
        button.tap()
        let newValue = button.label
        XCTAssert(value != newValue, "Increment value has been not incremented")
    }
    
    func testGoToSettingsModuleAndBack() {
        self.application.buttons["SettingsBarItem"].tap()
        self.application.navigationBars["Настройки"].buttons["КЛИКАЙ!"].tap()
    }
}
