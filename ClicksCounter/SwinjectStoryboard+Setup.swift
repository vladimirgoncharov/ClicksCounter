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
    class func setup() {
        self.setupModuleService()
        self.setupApplicationService()
        self.setupStoreService()
        self.setupSettingsService()
        self.setupClicksCounterService()
        
        self.setupIncrementModule()
    }
}
