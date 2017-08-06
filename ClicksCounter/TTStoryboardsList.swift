//
//  TTStoryboardsList.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

/*----------Storyboards----------*/
enum AppStoryboard: Int {
    case main = 0
    
    //MARK: -
    var name: String {
        switch self {
        case .main     : return "Main"
        }
    }
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: self.name, bundle: Bundle.main)
    }
    
    var initialController: UIViewController? {
        return self.storyboard.instantiateInitialViewController()
    }
}

/*----------Views----------*/
enum AppViews: Int {
    //screens
    case navigation = 0
    case increment
    case settings
    
    //MARK: -
    var stryboardID: String {
        switch self {
        case .navigation                    : return "Initial"
        case .increment                     : return "TTIncrementView"
        case .settings                      : return "TTSettingsView"
        }
    }
    
    var storyboard: UIStoryboard? {
        
        var storyboard: UIStoryboard? = nil
        
        switch self {
        case .navigation,
             .increment,
             .settings:
            storyboard = AppStoryboard.main.storyboard
        }
        
        return storyboard
    }
    
    var viewController: UIViewController? {
        return self.storyboard?.instantiateViewController(withIdentifier: self.stryboardID)
    }
}
