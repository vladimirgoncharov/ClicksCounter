//
//  TTSettingsUITests.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 06/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import XCTest

class TTSettingsUITests: XCTestCase, TTBaseModuleUIProtocol {
        
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
    func testReset() {
        self.application.buttons["IncrementButton"].tap()
        self.application.buttons["SettingsBarItem"].tap()
        self.application.buttons["ResetBarItem"].tap()
        self.application.clickBackButtonItem()
        XCTAssert(Int(self.application.buttons["IncrementButton"].label) == TTDefaultValue.NumberOfClicks, "Increment value not reset")
    }
    
    func testSave() {
        self.application.buttons["SettingsBarItem"].tap()
        self.application.buttons["SaveBarItem"].tap()
    }
    
    func testTableBehavior() {
        self.application.buttons["SettingsBarItem"].tap()
        self.application.tables.cells.containing(.staticText, identifier:"Шаг инкрементирования (мин. 1 и макс. 100000000)").buttons["Increment"].tap()
         self.application.tables.cells.containing(.staticText, identifier:"Шаг инкрементирования (мин. 1 и макс. 100000000)").buttons["Decrement"].tap()
    }
}
