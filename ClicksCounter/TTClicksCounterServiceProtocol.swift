//
//  TTClicksCounterService.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation

protocol TTClicksCounterServiceProtocol: NSObjectProtocol {
    var storeService: TTStoreServiceProtocol { get }
    var settingsService: TTSettingsServiceProtocol { get }
    
    var clicksCount: Int { get }
    
    func increment()
    func reset()
}
