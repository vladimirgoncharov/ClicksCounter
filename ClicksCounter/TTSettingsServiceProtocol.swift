//
//  TTSettingsServiceProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation

protocol TTSettingsServiceProtocol: NSObjectProtocol {
    var storeService: TTStoreServiceProtocol { get }

    var incrementStep: Int { get set }
    var maxNumberOfClicks: Int { get set }
    
    func reset()
}

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
