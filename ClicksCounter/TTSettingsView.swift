//
//  TTSettingsView.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 06/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

class TTSettingsView: UIViewController, TTSettingsViewProtocol, TTSettingsDisplayManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resetBarItem: UIBarButtonItem!
    @IBOutlet weak var saveBarItem: UIBarButtonItem!
    
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

    //MARK:- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resetBarItem.accessibilityIdentifier = "ResetBarItem"
        self.saveBarItem.accessibilityIdentifier = "SaveBarItem"
        
        self.displayManager.delegate = self
        
        self.tableView.dataSource = self.displayManager
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 44.0
        
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
    
    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    //MARK:- TTSettingsDisplayManagerDelegate
    func settingsDisplayManager(manager: TTSettingsDisplayManager, configureCell cell: UITableViewCell, atIndexPath indexPath: IndexPath, forCellData cellData: TTSettingsDisplayManagerCellDataProtocol) {
        switch cellData.type {
        case .stepper:
            let stepperCell = cell as! TTLabelStepperTableCell
            let stepperData = cellData as! TTSettingsDisplayManagerStepperCellData
            stepperCell.leftLabel.text = stepperData.leftText
            stepperCell.valueLabel.text = String(Int(stepperData.value))
            stepperCell.stepper.maximumValue = stepperData.maxValue
            stepperCell.stepper.minimumValue = stepperData.minValue
            stepperCell.stepper.value = stepperData.value
            stepperCell.valueDidChange = { (cell, newValue) in
                stepperCell.valueLabel.text = String(Int(newValue))
                switch stepperData.identifier {
                case TTSettingsPresenter.CellIdentifier.incrementStep: self.presenter.setIncrementStep(value: Int(newValue))
                case TTSettingsPresenter.CellIdentifier.maxNumberOfClicks: self.presenter.setMaxNumberOfClicks(value: Int(newValue))
                default: break
                }
            }
        }
    }
}
