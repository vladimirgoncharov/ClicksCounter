//
//  TTSettingsPresenterProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 06/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation

protocol TTSettingsPresenterProtocol: NSObjectProtocol {
    weak var view: TTSettingsViewProtocol? { get set }
    var clicksCounterService: TTClicksCounterServiceProtocol { get }
    
    func setIncrementStep(value: Int)
    func setMaxNumberOfClicks(value: Int)
    
    func viewDidLoad()
    
    func saveSettings()
    func reset()
}
