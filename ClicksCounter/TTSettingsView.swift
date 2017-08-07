//
//  TTSettingsView.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 06/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

class TTSettingsView: UIViewController, TTSettingsViewProtocol, TTSettingsDisplayManagerDelegate {
    
    var presenter: TTSettingsPresenterProtocol! {
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
    fileprivate let displayManager = TTSettingsDisplayManager()
    
    //MARK:- UI elements
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resetBarItem: UIBarButtonItem!
    @IBOutlet weak var saveBarItem: UIBarButtonItem!

    //MARK:- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resetBarItem.accessibilityIdentifier = "ResetBarItem"
        self.saveBarItem.accessibilityIdentifier = "SaveBarItem"
        
        self.displayManager.delegate = self
        
        self.presenter.viewDidLoad()
    }
    
    //MARK:- actions
    @IBAction func saveSettingsAction(sender: Any) {
        self.presenter.saveSettings()
    }
    
    @IBAction func resetAction(sender: Any) {
        self.presenter.reset()
    }
    
    //MARK:- TTSettingsViewProtocol
    func presentSettings(cellData: [TTSettingsDisplayManagerCellDataProtocol]) {
        self.displayManager.prepare(tableView: self.tableView, cellData: cellData)
    }
    
    //MARK:- TTSettingsDisplayManagerDelegate
    func settingsDisplayManager(manager: TTSettingsDisplayManager, stepperCellNeedChangeValue newValue: Double, forCellData cellData: TTSettingsDisplayManagerCellDataProtocol) {
        switch cellData.identifier {
        case TTSettingsPresenter.CellIdentifier.incrementStep: self.presenter.setIncrementStep(value: Int(newValue))
        case TTSettingsPresenter.CellIdentifier.maxNumberOfClicks: self.presenter.setMaxNumberOfClicks(value: Int(newValue))
        default: break
        }
    }
}
