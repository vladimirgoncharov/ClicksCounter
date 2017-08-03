//
//  TTSettingsService.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit
import SwinjectStoryboard

class TTSettingsService: NSObject, TTSettingsServiceProtocol {
    
    typealias SettingsType = TTSettings
    
    let storeService: TTStoreServiceProtocol
    
    private(set) var settings: SettingsType
    
    var incrementStep: Int {
        get {
            return self.settings.incrementStep
        }
        set {
            var newValue = newValue
            newValue = max(newValue, TTMinValue.IncrementStep)
            newValue = min(newValue, TTMaxValue.IncrementStep)
            self.settings.incrementStep = newValue
            self.save()
        }
    }
    var maxNumberOfClicks: Int {
        get {
            return self.settings.maxNumberOfClicks
        }
        set {
            var newValue = newValue
            newValue = max(newValue, TTMinValue.NumberOfClicks)
            newValue = min(newValue, TTMaxValue.NumberOfClicks)
            self.settings.maxNumberOfClicks = newValue
            self.save()
        }
    }
    
    //MARK:-
    init(storeService: TTStoreServiceProtocol) {
        self.storeService = storeService
        
        self.settings = storeService.loadSettings() ?? SettingsType()
        
        super.init()
    }
    
    func reset() {
        self.settings = SettingsType()
        self.save()
    }
}

//MARK:- Private
fileprivate extension TTSettingsService {
    func save() {
        do {
           try self.storeService.save(settings: self.settings)
        } catch let error {
            print(error)
        }
    }
}
