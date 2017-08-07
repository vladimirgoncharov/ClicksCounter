//
//  TTSettingsViewProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 06/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

/// Protocol for implementation Settings UIViewController
protocol TTSettingsViewProtocol: NSObjectProtocol, UITableViewDelegate {
    var presenter: TTSettingsPresenterProtocol! { get set }
    
    /// Display in table view the cell data
    ///
    /// - Parameter cellData: The list of the cells
    func presentSettings(cellData: [TTSettingsDisplayManagerCellDataProtocol])
}
