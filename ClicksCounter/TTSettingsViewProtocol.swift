//
//  TTSettingsViewProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 06/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

protocol TTSettingsViewProtocol: NSObjectProtocol, UITableViewDelegate {
    var presenter: TTSettingsPresenterProtocol! { get set }
    
    func presentSettings(cellData: [TTSettingsDisplayManagerCellDataProtocol])
}
