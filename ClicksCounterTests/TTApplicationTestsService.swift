//
//  TTApplicationTestsService.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 02/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation
import SwinjectStoryboard
@testable import ClicksCounter

class TTApplicationTestsService: NSObject, TTApplicationServiceProtocol {
    
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
        return true
    }
}
