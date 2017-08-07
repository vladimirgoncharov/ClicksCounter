//
//  TTSettingsPresenter.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 06/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

//MARK:-
/// The container for
class TTSettingsDisplayManagerStepperCellData: TTSettingsDisplayManagerCellDataProtocol {
    
    //MARK:- TTSettingsDisplayManagerCellDataProtocol
    let identifier: String
    var type: TTSettingsDisplayManager.CellType {
        return .stepper
    }
    
    /// Description of the value
    let title: String
    /// Current stepper value
    fileprivate(set) var value: Double
    /// Minimal stepper value
    let minValue: Double
    /// Maximum stepper value
    let maxValue: Double
    
    init(identifier: String,
         title: String,
         value: Double,
         minValue: Double,
         maxValue: Double) {
        self.identifier = identifier
        self.title = title
        self.value = value
        self.minValue = minValue
        self.maxValue = maxValue
    }
}

//MARK:-
class TTSettingsPresenter: NSObject, TTSettingsPresenterProtocol {
    weak var view: TTSettingsViewProtocol?
    
    fileprivate(set) var clicksCounterService: TTClicksCounterServiceProtocol
    
    /// List of settings
    fileprivate lazy var cellData: [TTSettingsDisplayManagerCellDataProtocol] = {[unowned self] in
        return [
            TTSettingsDisplayManagerStepperCellData(
                identifier: CellIdentifier.incrementStep,
                title: "Шаг инкрементирования (мин. \(type(of: self.clicksCounterService.settingsService).minIncrementStep) и макс. \(type(of: self.clicksCounterService.settingsService).maxIncrementStep))",
                value: Double(self.clicksCounterService.settingsService.incrementStep),
                minValue: Double(type(of: self.clicksCounterService.settingsService).minIncrementStep),
                maxValue: Double(type(of: self.clicksCounterService.settingsService).maxIncrementStep)
            ),
            TTSettingsDisplayManagerStepperCellData(
                identifier: CellIdentifier.maxNumberOfClicks,
                title: "Максимальное число инкремента (мин. \(type(of: self.clicksCounterService.settingsService).minNumberOfClicks) и макс. \(type(of: self.clicksCounterService.settingsService).maxNumberOfClicks))",
                value: Double(self.clicksCounterService.settingsService.maxNumberOfClicks),
                minValue: Double(type(of: self.clicksCounterService.settingsService).minNumberOfClicks),
                maxValue: Double(type(of: self.clicksCounterService.settingsService).maxNumberOfClicks)
            )
        ]
    }()
    
    init(clicksCounterService: TTClicksCounterServiceProtocol) {
        self.clicksCounterService = clicksCounterService
        super.init()
    }

    //MARK:- TTSettingsPresenterProtocol
    func viewDidLoad() {
        self.view?.presentSettings(cellData: self.cellData)
    }
    
    func setIncrementStep(value: Int) {
        (self.cellData.find(identifier: CellIdentifier.incrementStep) as? TTSettingsDisplayManagerStepperCellData)?.value = Double(value)
    }
    
    func setMaxNumberOfClicks(value: Int) {
        (self.cellData.find(identifier: CellIdentifier.maxNumberOfClicks) as? TTSettingsDisplayManagerStepperCellData)?.value = Double(value)
    }
    
    func saveSettings() {
        self.cellData.forEach { (currentCellData) in
            switch currentCellData.identifier {
            case CellIdentifier.incrementStep:
                if  let currentCellData = currentCellData as? TTSettingsDisplayManagerStepperCellData {
                    self.clicksCounterService.settingsService.incrementStep = Int(currentCellData.value)
                }
                
            case CellIdentifier.maxNumberOfClicks:
                if  let currentCellData = currentCellData as? TTSettingsDisplayManagerStepperCellData {
                    self.clicksCounterService.settingsService.maxNumberOfClicks = Int(currentCellData.value)
                }
            default: break
            }
        }
    }
    
    func reset() {
        self.clicksCounterService.reset()
    }
}

//MARK:-
extension TTSettingsPresenter {
    enum CellIdentifier {
        static let incrementStep = "__incrementStep"
        static let maxNumberOfClicks = "__maxNumberOfClicks"
    }
}
