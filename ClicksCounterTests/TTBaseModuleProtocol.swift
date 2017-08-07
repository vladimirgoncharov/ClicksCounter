//
//  TTBaseModuleProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit
import SwinjectStoryboard
@testable import ClicksCounter

/// Base protocol for MVP modules. Creating and displaying an view on key window.
protocol TTBaseModuleProtocol: NSObjectProtocol {
    /// Should return custom view controller
    associatedtype View: UIViewController
    
    /// Current view controller. You should call ```func initView()``` for initialization.
    var view: View! { get set }
    var modulePresenter: TTModulePresenterProtocol! { get set }
    
    /// Should return storyboard of the view controller
    static var storyboardName: String { get }
    /// Should return storyboard identifier of the view controller
    static var storyboardIdentifier: String { get }
}

//MARK:- initialization helper methods
extension TTBaseModuleProtocol {
    /// Should call in ```func setUp()```
    func initView() {
        self.modulePresenter = SwinjectStoryboard.defaultContainer.resolve(TTModulePresenterProtocol.self)!
        
        self.view = UIStoryboard(name: type(of: self).storyboardName, bundle: nil).instantiateViewController(withIdentifier: type(of: self).storyboardIdentifier) as! View
        self.view.loadViewIfNeeded()
        
        self.modulePresenter.swapRootController(newController: self.view, animated: false)
    }
    
    /// Should call in ```func tearDown()```
    func deinitView() {
        self.view = nil
        self.modulePresenter.swapRootController(newController: nil, animated: false)
    }
}
