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
    func testSettingsUI() {
        self.application.navigationBars["КЛИКАЙ!"].buttons["SettingsBarItem"].tap()
        
        let clickscounterTtsettingsviewNavigationBar = self.application.navigationBars["ClicksCounter.TTSettingsView"]
        
        let tablesQuery = self.application.tables
        tablesQuery.cells.containing(.staticText, identifier:"Шаг инкрементирования (мин. 1 и макс. 100000000)").buttons["Increment"].tap()
        
        let cellsQuery = tablesQuery.cells.containing(.staticText, identifier:"Шаг инкрементирования (мин. 1 и макс. 100000000)")
        cellsQuery.buttons["Increment"].tap()
        tablesQuery.cells.containing(.staticText, identifier:"Шаг инкрементирования (мин. 1 и макс. 100000000)").buttons["Decrement"].tap()
        cellsQuery.buttons["Decrement"].tap()
        
        let cellsQuery2 = tablesQuery.cells.containing(.staticText, identifier:"Максимальное число инкремента (мин. 1 и макс. 100000000)")
        cellsQuery2.buttons["Increment"].tap()
        tablesQuery.cells.containing(.staticText, identifier:"Максимальное число инкремента (мин. 1 и макс. 100000000)").buttons["Decrement"].tap()
        cellsQuery2.buttons["Decrement"].tap()
        
        clickscounterTtsettingsviewNavigationBar.buttons["Сбросить"].tap()
        clickscounterTtsettingsviewNavigationBar.buttons["Сохранить"].tap()
        clickscounterTtsettingsviewNavigationBar.buttons["КЛИКАЙ!"].tap()
        
    }
    
}
