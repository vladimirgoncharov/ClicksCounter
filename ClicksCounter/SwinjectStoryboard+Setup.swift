//
//  SwinjectStoryboard+Setup.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    /// Called by Swinject framework once before SwinjectStoryboard is instantiated. You need to setup all DI modules here
    ///
    /// - Note:
    ///   Implement this method and setup the default container if you implicitly instantiate UIWindow
    ///   and its root view controller from "Main" storyboard.
    class func setup() {
        self.setupModuleService()
        self.setupApplicationService()
        self.setupStoreService()
        self.setupSettingsService()
        self.setupClicksCounterService()
        
        self.setupIncrementModule()
        self.setupSettingsModule()
    }
}
