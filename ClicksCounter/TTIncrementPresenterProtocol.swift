//
//  TTIncrementPresenterProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation

protocol TTIncrementPresenterProtocol: NSObjectProtocol {
    weak var view: TTIncrementViewProtocol? { get set }
    var clicksCounterService: TTClicksCounterServiceProtocol { get }
    
    var clicksCount: Int { get }
    
    func viewDidLoad()
    
    func incrementClicksCount()
}
