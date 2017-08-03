//
//  TTStoreService.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

class TTUserDefaultsStoreService: NSObject, TTStoreServiceProtocol {
    
    //MARK:- parameters
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
        super.init()
    }
    
    //MARK:- Clicks
    func save(numberOfClicks: Int) throws {
        self.userDefaults.setValue(numberOfClicks, forKey: Key.NumberOfClicks.value)
        self.userDefaults.synchronize()
    }
    
    func loadNumberOfClicks() -> Int? {
        return self.userDefaults.value(forKey: Key.NumberOfClicks.value) as? Int
    }
    
    //MARK:- Settings
    func save(settings: TTSettings) throws {
        let data = NSKeyedArchiver.archivedData(withRootObject: settings)
        self.userDefaults.setValue(data, forKey: Key.Settings.value)
        self.userDefaults.synchronize()
    }
    
    func loadSettings() -> TTSettings? {
        if  let data = self.userDefaults.value(forKey: Key.Settings.value) as? Data,
            let settings = NSKeyedUnarchiver.unarchiveObject(with: data) as? TTSettings {
                return settings
        }
        return nil
    }
    
    //MARK:- Helpers
    func dropData() {
        Key.allCases().forEach { [unowned self] in
            self.userDefaults.removeObject(forKey: $0.value)
        }
    }
}

//MARK:- Enums
extension TTUserDefaultsStoreService {
    
    fileprivate enum Key: Int {
        case NumberOfClicks = 0
        case Settings
        
        var value: String {
            switch self {
            case .NumberOfClicks:   return "__NumberOfClicks"
            case .Settings:         return "__Settings"
            }
        }
    }
}
