//
//  UITestHelpers.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import XCTest

@available(iOS 9, *)
extension XCUIApplication {
    
    func launchWithTestEnvironment(env: [String : String] = ProcessInfo.processInfo.environment) {
        self.launchEnvironment = env
        self.launch()
    }
}

extension XCUIApplication {
    
    func clickBackButtonItem() {
        self.navigationBars.buttons.element(boundBy: 0).tap()
    }
}
