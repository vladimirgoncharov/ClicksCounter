//
//  TTModulePresenterProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 03/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

protocol TTModulePresenterProtocol: NSObjectProtocol {
    var window: UIWindow? { get set }
}

extension TTModulePresenterProtocol {
    func swapRootController(newController: UIViewController, animated: Bool) {
        if let oldController = self.window?.rootViewController {
            UIView.transition(from: oldController.view,
                              to: newController.view,
                              duration: animated ? 0.3 : 0.0,
                              options: [.layoutSubviews, .allowAnimatedContent, .transitionCrossDissolve],
                              completion: { (finished) in
                                self.window?.rootViewController = newController
                                oldController.dismiss(animated: false, completion: nil)
                                oldController.removeFromParentViewController()
                                oldController.view.removeFromSuperview()
            })
        } else {
            self.window?.rootViewController = newController
        }
    }
}
