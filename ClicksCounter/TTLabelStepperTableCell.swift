//
//  TTLabelStepperTableCell.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 06/08/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

class TTLabelStepperTableCell: UITableViewCell {

    //MARK:- UI
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var valueLabel: UILabel!
    
    var valueDidChange: ((_ cell: TTLabelStepperTableCell, _ value: Double) -> Void)?
    
    //MARK: -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareForReuse()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.valueDidChange = nil
        
        self.leftLabel.text = nil
        self.valueLabel.text = nil
        
        self.stepper.value = 0
        self.stepper.minimumValue = 0
        self.stepper.maximumValue = 100
        self.stepper.stepValue = 1
    }
    
    //MARK: - actions
    @IBAction func valueDidChange(sender: UIStepper) {
        if sender == self.stepper {
            self.valueDidChange?(self, sender.value)
        }
    }
}
