//
//  TTClicksCounterService.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation

/// The service should manage number of clicks
protocol TTClicksCounterServiceProtocol: NSObjectProtocol {
    var storeService: TTStoreServiceProtocol { get }
    var settingsService: TTSettingsServiceProtocol { get }
    
    /// Current number of clicks
    var clicksCount: Int { get }
    
    /// Should increment value and save to a storage
    func increment()
    
    /// Should reset to default value and save to a storage
    func reset()
}
