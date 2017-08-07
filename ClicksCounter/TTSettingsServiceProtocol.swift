//
//  TTSettingsServiceProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation

/// The service should manage current settings data
protocol TTSettingsServiceProtocol: NSObjectProtocol {
    var storeService: TTStoreServiceProtocol { get }

    /// Current increment step from settings
    var incrementStep: Int { get set }
    /// Current max number of clicks from settings
    var maxNumberOfClicks: Int { get set }
    
    /// Should reset to default settings and save to a storage
    func reset()
}

// MARK: - Constants
extension TTSettingsServiceProtocol {
    static var minIncrementStep: Int {
        return TTMinValue.IncrementStep
    }
    static var maxIncrementStep: Int {
        return TTMaxValue.IncrementStep
    }
    static var minNumberOfClicks: Int {
        return TTMinValue.NumberOfClicks
    }
    static var maxNumberOfClicks: Int {
        return TTMaxValue.NumberOfClicks
    }
}
