//
//  TTStoreServiceProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation

protocol TTStoreServiceProtocol: NSObjectProtocol {
    
    func save(numberOfClicks: Int) throws
    func loadNumberOfClicks() -> Int?
    
    func save(settings: TTSettings) throws
    func loadSettings() -> TTSettings?
    
    func dropData()
}
