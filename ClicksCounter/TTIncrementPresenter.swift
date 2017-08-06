//
//  TTIncrementPresenter.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

class TTIncrementPresenter: NSObject, TTIncrementPresenterProtocol {
    
    weak var view: TTIncrementViewProtocol? 
    fileprivate(set) var clicksCounterService: TTClicksCounterServiceProtocol
    
    init(clicksCounterService: TTClicksCounterServiceProtocol) {
        self.clicksCounterService = clicksCounterService
        super.init()
    }
    
    //MARK:- TTIncrementPresenterProtocol
    var clicksCount: Int {
        return self.clicksCounterService.clicksCount
    }
    
    func incrementClicksCount() {
        self.clicksCounterService.increment()
        self.view?.setClicks(value: self.clicksCount)
    }
    
    func viewDidLoad() {}
    
    func viewWillAppear(_ animated: Bool) {
        self.view?.setClicks(value: self.clicksCount)
    }
}
