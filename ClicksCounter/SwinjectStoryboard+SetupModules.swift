//
//  SwinjectStoryboard+SetupModules.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    class func setupIncrementModule() {
        self.defaultContainer.register(TTIncrementPresenterProtocol.self) { r in
            let clicksCounterService = r.resolve(TTClicksCounterServiceProtocol.self)!
            return TTIncrementPresenter(clicksCounterService: clicksCounterService)
        }
        self.defaultContainer.storyboardInitCompleted(TTIncrementView.self) { r, c in
            let presenter = r.resolve(TTIncrementPresenterProtocol.self)
            c.presenter = presenter
        }
    }
    
    class func setupSettingsModule() {
        self.defaultContainer.register(TTSettingsPresenterProtocol.self) { r in
            let clicksCounterService = r.resolve(TTClicksCounterServiceProtocol.self)!
            return TTSettingsPresenter(clicksCounterService: clicksCounterService)
        }
        self.defaultContainer.storyboardInitCompleted(TTSettingsView.self) { r, c in
            let presenter = r.resolve(TTSettingsPresenterProtocol.self)
            c.presenter = presenter
        }
    }
}
