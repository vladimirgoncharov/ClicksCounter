//
//  TTIncrementViewProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

protocol TTIncrementViewProtocol: NSObjectProtocol {
    var presenter: TTIncrementPresenterProtocol! { get set }
    
    func setClicks(value: Int)
}
