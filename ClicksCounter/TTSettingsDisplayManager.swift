//
//  TTSettingsDisplayManager.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 06/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

//MARK:-
protocol TTSettingsDisplayManagerCellDataProtocol {
    var identifier: String { get }
    var type: TTSettingsDisplayManager.CellType { get }
}

extension Array where Element == TTSettingsDisplayManagerCellDataProtocol {
    func find(identifier: String) -> Element? {
        return self.filter({ (cellData) -> Bool in
            return cellData.identifier == identifier
        }).first
    }
}

//MARK:-
protocol TTSettingsDisplayManagerDelegate: NSObjectProtocol {
    func settingsDisplayManager(manager: TTSettingsDisplayManager, configureCell cell: UITableViewCell, atIndexPath indexPath: IndexPath, forCellData cellData: TTSettingsDisplayManagerCellDataProtocol)
}

class TTSettingsDisplayManager: NSObject, UITableViewDataSource {
    
    private(set) weak var tableView: UITableView? {
        didSet {
            if let oldTableView = oldValue {
                oldTableView.dataSource = nil
                oldTableView.delegate = nil
                oldTableView.reloadData()
            }
        }
    }
    private(set) var cellData: [TTSettingsDisplayManagerCellDataProtocol] = []
    weak var delegate: TTSettingsDisplayManagerDelegate?
    
    //MARK:-
    func prepare(tableView: UITableView, cellData: [TTSettingsDisplayManagerCellDataProtocol]) {
        self.tableView = tableView
        CellType.allCases().forEach {[unowned tableView] (cellType) in
            tableView.register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
        }
        self.cellData = cellData
        self.reloadData()
    }
    
    func reloadData() {
        self.tableView?.reloadData()
    }
}

//MARK:- handle table
extension TTSettingsDisplayManager {
    
    enum CellType: Int, CellProtocol {
        case stepper
        
        var cellClass: AnyClass {
            switch self {
            case .stepper: return TTLabelStepperTableCell.self
            }
        }
    }
    
    //MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCellData = self.cellData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: currentCellData.type.identifier, for: indexPath)
        self.delegate?.settingsDisplayManager(manager: self, configureCell: cell, atIndexPath: indexPath, forCellData: currentCellData)
        return cell
    }
}
