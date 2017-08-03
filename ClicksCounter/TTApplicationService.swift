//
//  TTApplicationService.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 01/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

class TTApplicationService: NSObject, TTApplicationServiceProtocol {
    
    let modulePresenter: TTModulePresenterProtocol
    var window: UIWindow? {
        didSet {
            self.modulePresenter.window = self.window
        }
    }
    
    init(modulePresenter: TTModulePresenterProtocol) {
        self.modulePresenter = modulePresenter
        super.init()
    }
    
    //MARK: - TTApplicationServiceProtocol
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //checking environmnet
        if  let animationsEnabledString = GetEnvironment(key: TTLaunchEnvironmentKey.AnimationsEnabled) {
            switch animationsEnabledString {
            case TTLaunchEnvironmentKey.AnimationsEnabledValue.YES:
                UIView.setAnimationsEnabled(true)
                
            case TTLaunchEnvironmentKey.AnimationsEnabledValue.NO:
                UIView.setAnimationsEnabled(false)
                
            default: break
            }
        }
        
        if  let startStoryboardString = GetEnvironment(key: TTLaunchEnvironmentKey.StartStoryboard),
            let initialViewController = UIStoryboard(name: startStoryboardString, bundle: nil).instantiateInitialViewController() {
            self.modulePresenter.swapRootController(newController: initialViewController, animated: false)
        }
        
        return true
    }
}

