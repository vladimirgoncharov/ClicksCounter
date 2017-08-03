//
//  AppDelegate.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit
import SwinjectStoryboard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var appService: TTApplicationServiceProtocol = {
        var appService = SwinjectStoryboard.defaultContainer.resolve(TTApplicationServiceProtocol.self)!
        appService.window = self.window
        return appService
    }()

    //MARK:- UIApplicationDelegate
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return self.appService.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

