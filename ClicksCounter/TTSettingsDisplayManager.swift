//
//  TTSettingsDisplayManager.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 06/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

//MARK:-
/// Protocol for elements of TTSettingsDisplayManager
protocol TTSettingsDisplayManagerCellDataProtocol {
    /// Must be unique identifier
    var identifier: String { get }
    /// Cell type for displaying the element
    var type: TTSettingsDisplayManager.CellType { get }
}

extension Array where Element == TTSettingsDisplayManagerCellDataProtocol {
    /// Search element by identirfier
    ///
    /// - Parameter identifier: element identifier
    /// - Returns: Found element
    func find(identifier: String) -> Element? {
        return self.filter({ (cellData) -> Bool in
            return cellData.identifier == identifier
        }).first
    }
}

//MARK:-
/// TTSettingsDisplayManager delegate
protocol TTSettingsDisplayManagerDelegate: NSObjectProtocol {
    /// The method is calling when an user touched on a stepper
    ///
    /// - Parameters:
    ///   - manager: The sender
    ///   - newValue: The new value
    ///   - cellData: The current element
    func settingsDisplayManager(manager: TTSettingsDisplayManager, stepperCellNeedChangeValue newValue: Double, forCellData cellData: TTSettingsDisplayManagerCellDataProtocol)
}

/// Display cells for TTSettingsDisplayManagerCellDataProtocol
class TTSettingsDisplayManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    /// Working table for the manager
    private(set) weak var tableView: UITableView? {
        didSet {
            if let oldTableView = oldValue {
                oldTableView.dataSource = nil
                oldTableView.delegate = nil
                oldTableView.reloadData()
            }
            if let tableView = self.tableView {
                tableView.dataSource = self
                tableView.delegate = self
                tableView.estimatedRowHeight = 44.0
            }
        }
    }
    /// List of settings metadata
    private(set) var cellData: [TTSettingsDisplayManagerCellDataProtocol] = []
    /// The object that acts as the delegate of the settings display manager
    weak var delegate: TTSettingsDisplayManagerDelegate?
    
    //MARK:-
    /// Setting the manager with the necessary parameters
    ///
    /// - Parameters:
    ///   - tableView: The table view for displaying the cell data
    ///   - cellData: The list of the cells
    func prepare(tableView: UITableView, cellData: [TTSettingsDisplayManagerCellDataProtocol]) {
        self.tableView = tableView
        CellType.allCases().forEach {[unowned tableView] (cellType) in
            tableView.register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
        }
        self.cellData = cellData
        self.reloadData()
    }
    
    /// Call this method to reload all the data that is used to construct the table, including cells, section headers and footers, index arrays, and so on.
    func reloadData() {
        self.tableView?.reloadData()
    }
}

//MARK:- UITableViewDelegate
extension TTSettingsDisplayManager {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

//MARK:- UITableViewDataSource
extension TTSettingsDisplayManager {
    
    /// List of available cells
    enum CellType: Int, CellProtocol {
        case stepper
        
        var cellClass: AnyClass {
            switch self {
            case .stepper: return TTLabelStepperTableCell.self
            }
        }
    }
    
    //MARK:-
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCellData = self.cellData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: currentCellData.type.identifier, for: indexPath)
        switch currentCellData.type {
        case .stepper:
            let stepperCell = cell as! TTLabelStepperTableCell
            if let stepperData = currentCellData as? TTSettingsDisplayManagerStepperCellData {
                stepperCell.leftLabel.text = stepperData.title
                stepperCell.valueLabel.text = String(Int(stepperData.value))
                stepperCell.stepper.maximumValue = stepperData.maxValue
                stepperCell.stepper.minimumValue = stepperData.minValue
                stepperCell.stepper.value = stepperData.value
                stepperCell.valueDidChange = {[unowned self] (cell, newValue) in
                    stepperCell.valueLabel.text = String(Int(newValue))
                    self.delegate?.settingsDisplayManager(manager: self, stepperCellNeedChangeValue: newValue, forCellData: stepperData)
                }
            }
        }
        return cell
    }
}
