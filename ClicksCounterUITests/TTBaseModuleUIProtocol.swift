//
//  TTBaseModuleUIProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit
import XCTest

protocol TTBaseModuleUIProtocol: NSObjectProtocol {
    var application: XCUIApplication! { get set }
}

//MARK:- initialization helper methods
extension TTBaseModuleUIProtocol {
    
    func runApplication(storyboardName: String,
                        animationEnabled: String = TTLaunchEnvironmentKey.AnimationsEnabledValue.YES) {
        self.application = XCUIApplication()
        
        var env = ProcessInfo.processInfo.environment
        env[TTLaunchEnvironmentKey.StartStoryboard] = storyboardName
        env[TTLaunchEnvironmentKey.AnimationsEnabled] = animationEnabled
        self.application.launchWithTestEnvironment(env: env)
    }
    
    func terminateApplication() {
        self.application.terminate()
        self.application = nil
    }
}
