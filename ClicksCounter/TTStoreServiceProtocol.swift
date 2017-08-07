//
//  TTStoreServiceProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation

//MARK:-
/// The list of save error
enum TTStoreServiceSaveError: Error {}

/// The service should save and load data
protocol TTStoreServiceProtocol: NSObjectProtocol {
    
    /// Should save number of clicks to a storage
    ///
    /// - Parameter numberOfClicks: New number of clicks
    /// - Throws: should return TTStoreServiceSaveError with localized description
    func save(numberOfClicks: Int) throws
    /// Should load number of clicks from a storage
    ///
    /// - Returns: number of clicks
    func loadNumberOfClicks() -> Int?
    
    /// Should save settings from a storage
    ///
    /// - Parameter settings: New setting data
    /// - Throws: should return TTStoreServiceSaveError with localized description
    func save(settings: TTSettings) throws
    /// Should load settings from a storage
    ///
    /// - Returns: settings
    func loadSettings() -> TTSettings?
    
    /// Delete all saved data
    func dropData()
}
