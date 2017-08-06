//
//  TTIncrementView.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

class TTIncrementView: UIViewController, TTIncrementViewProtocol {

    var presenter: TTIncrementPresenterProtocol! {
        willSet {
            if let presenter = self.presenter {
                presenter.view = nil
            }
        }
        didSet {
            if let presenter = self.presenter {
                presenter.view = self
            }
        }
    }
    
    //MARK:- UI elements
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var settingsBarItem: UIBarButtonItem!
    
    //MARK:- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.settingsBarItem.accessibilityIdentifier = "SettingsBarItem"
        
        self.incrementButton.titleLabel?.minimumScaleFactor = 0.5
        
        self.presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear(animated)
    }

    //MARK:- actions
    @IBAction func incrementAction(sender: Any) {
        self.presenter.incrementClicksCount()
    }
    
    //MARK:- TTIncrementViewProtocol
    func setClicks(value: Int) {
        self.incrementButton.setTitle(String(value), for: .normal)
    }
}
