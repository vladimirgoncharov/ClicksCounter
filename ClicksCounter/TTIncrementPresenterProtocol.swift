//
//  TTIncrementPresenterProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation

/// Implementation of business logic for Increment Module
protocol TTIncrementPresenterProtocol: NSObjectProtocol {
    weak var view: TTIncrementViewProtocol? { get set }
    var clicksCounterService: TTClicksCounterServiceProtocol { get }
    
    /// Should return the current number of clicks
    var clicksCount: Int { get }
    
    /// Should call when the view is loaded
    func viewDidLoad()
    /// Should call when the view will appear
    func viewWillAppear(_ animated: Bool)
    
    /// Should increment number of clicks and save the value
    func incrementClicksCount()
}
