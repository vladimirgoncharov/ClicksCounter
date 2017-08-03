//
//  SwinjectStoryboard+SetupTestsServices.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 02/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation
import SwinjectStoryboard
@testable import ClicksCounter

extension SwinjectStoryboard {
    
    class func setupApplicationService() {
        self.defaultContainer.register(TTApplicationServiceProtocol.self) { r in
            let modulePresenter = r.resolve(TTModulePresenterProtocol.self)!
            return TTApplicationTestsService(modulePresenter: modulePresenter)
        }.inObjectScope(.graph)
    }
}
