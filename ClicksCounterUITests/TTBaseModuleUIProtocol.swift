//
//  TTBaseModuleUIProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit
import XCTest

/// Base protocol for UI tests. Creating and terminating new application.
protocol TTBaseModuleUIProtocol: NSObjectProtocol {
    /// Current application
    var application: XCUIApplication! { get set }
}

//MARK:- initialization helper methods
extension TTBaseModuleUIProtocol {
    
    /// Should call in ```func setUp()```. Creating and running new application
    ///
    /// - Parameters:
    ///   - storyboardName: Which a storyboard will be displayed. View controller is initialViewController of a storyboard.
    ///   - animationEnabled: Allow animations
    func runApplication(storyboardName: String,
                        animationEnabled: String = TTLaunchEnvironmentKey.AnimationsEnabledValue.YES) {
        self.application = XCUIApplication()
        
        var env = ProcessInfo.processInfo.environment
        env[TTLaunchEnvironmentKey.StartStoryboard] = storyboardName
        env[TTLaunchEnvironmentKey.AnimationsEnabled] = animationEnabled
        self.application.launchWithTestEnvironment(env: env)
    }
    
    /// Should call in ```func tearDown()```
    func terminateApplication() {
        self.application.terminate()
        self.application = nil
    }
}
