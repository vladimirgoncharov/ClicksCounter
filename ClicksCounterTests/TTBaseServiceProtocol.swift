//
//  TTBaseServiceProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation
import SwinjectStoryboard

protocol TTBaseServiceProtocol: NSObjectProtocol {
    associatedtype ServiceType
    
    var service: ServiceType! { get set }
}

//MARK:- initialization helper methods
extension TTBaseServiceProtocol {
    func initService() {
        self.service = SwinjectStoryboard.defaultContainer.resolve(ServiceType.self)
    }
    
    func deinitService() {
        self.service = nil
    }
}
