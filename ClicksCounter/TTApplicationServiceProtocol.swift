//
//  TTApplicationServiceProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 01/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

protocol TTApplicationServiceProtocol: NSObjectProtocol {
    
    var modulePresenter: TTModulePresenterProtocol { get }
    
    var window: UIWindow? { get set }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
}
