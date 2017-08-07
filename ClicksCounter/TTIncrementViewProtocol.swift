//
//  TTIncrementViewProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

/// Protocol for implementation Increment UIViewController
protocol TTIncrementViewProtocol: NSObjectProtocol {
    var presenter: TTIncrementPresenterProtocol! { get set }
    
    /// When the presenter is calling the method, you should update your UI with the number of clicks
    ///
    /// - Parameter value: New value of clicks count
    func setClicks(value: Int)
}
