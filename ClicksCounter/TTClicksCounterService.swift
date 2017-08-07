//
//  TTClicksCounterService.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit
import SwinjectStoryboard

class TTClicksCounterService: NSObject, TTClicksCounterServiceProtocol {
    
    let storeService: TTStoreServiceProtocol
    let settingsService: TTSettingsServiceProtocol
    
    private(set) var clicksCount: Int
    
    init(storeService: TTStoreServiceProtocol, settingsService: TTSettingsServiceProtocol) {
        self.storeService = storeService
        self.settingsService = settingsService
        
        self.clicksCount = storeService.loadNumberOfClicks() ?? TTDefaultValue.NumberOfClicks
        
        super.init()
    }
    
    func increment() {
        if self.settingsService.maxNumberOfClicks > 0 {
            self.clicksCount += self.settingsService.incrementStep
            while self.clicksCount > self.settingsService.maxNumberOfClicks {
                self.clicksCount -= self.settingsService.maxNumberOfClicks
            }
        } else {
            self.clicksCount = 0
        }
        self.save()
    }
    
    func reset() {
        self.clicksCount = TTDefaultValue.NumberOfClicks
        self.save()
    }
}

//MARK:- Private
fileprivate extension TTClicksCounterService {
    /// internal save method
    func save() {
        do {
            try self.storeService.save(numberOfClicks: self.clicksCount)
        } catch let error {
            print(error)
        }
    }
}
