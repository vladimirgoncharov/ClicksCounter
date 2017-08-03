//
//  TTBaseModuleProtocol.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 31/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

protocol TTBaseModuleProtocol: NSObjectProtocol {
    associatedtype View: UIViewController
    
    var view: View! { get set }
    
    static var storyboardName: String { get }
    static var storyboardIdentifier: String { get }
}

//MARK:- initialization helper methods
extension TTBaseModuleProtocol {
    func initView() {
        self.view = UIStoryboard(name: type(of: self).storyboardName, bundle: nil).instantiateViewController(withIdentifier: type(of: self).storyboardIdentifier) as! View
        self.view.loadViewIfNeeded()
    }
    
    func deinitView() {
        self.view = nil
    }
}
