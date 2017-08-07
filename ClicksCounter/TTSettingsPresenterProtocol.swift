//
//  TTSettingsPresenterProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 06/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation

/// Implementation of business logic for Settings Module
protocol TTSettingsPresenterProtocol: NSObjectProtocol {
    weak var view: TTSettingsViewProtocol? { get set }
    var clicksCounterService: TTClicksCounterServiceProtocol { get }
    
    /// Should set new value for increment step
    ///
    /// - Parameter value: New value of increment count
    func setIncrementStep(value: Int)
    /// Should set new value for max number of clicks
    ///
    /// - Parameter value: New value of max number of clicks
    func setMaxNumberOfClicks(value: Int)
    
    /// Should call when the view is loaded
    func viewDidLoad()
    
    
    /// Should save current values of increment count and max number of clicks
    func saveSettings()
    /// Should reset current number of clicks to default value
    func reset()
}
