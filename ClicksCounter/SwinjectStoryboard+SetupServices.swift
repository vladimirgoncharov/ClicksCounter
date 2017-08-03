//
//  SwinjectStoryboard+SetupServices.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    class func setupModuleService() {
        self.defaultContainer.register(TTModulePresenterProtocol.self) { _ in
            return TTModulePresenter()
        }.inObjectScope(.graph)
    }
    
    class func setupApplicationService() {
        self.defaultContainer.register(TTApplicationServiceProtocol.self) { r in
            let modulePresenter = r.resolve(TTModulePresenterProtocol.self)!
            return TTApplicationService(modulePresenter: modulePresenter)
        }.inObjectScope(.graph)
    }
    
    class func setupStoreService() {
        self.defaultContainer.register(TTStoreServiceProtocol.self) { _ in
            return TTUserDefaultsStoreService(userDefaults: UserDefaults.standard)
        }.inObjectScope(.graph)
    }
    
    class func setupSettingsService() {
        self.defaultContainer.register(TTSettingsServiceProtocol.self) { r in
            let storeService = r.resolve(TTStoreServiceProtocol.self)!
            return TTSettingsService(storeService: storeService)
        }.inObjectScope(.container)
    }
    
    class func setupClicksCounterService() {
        self.defaultContainer.register(TTClicksCounterServiceProtocol.self) { r in
            let storeService = r.resolve(TTStoreServiceProtocol.self)!
            let settingsService = r.resolve(TTSettingsServiceProtocol.self)!
            return TTClicksCounterService(storeService: storeService, settingsService: settingsService)
        }.inObjectScope(.container)
    }
}
