//
//  TTSettings.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

class TTSettings: NSObject, NSCoding {
    
    var incrementStep: Int
    var maxNumberOfClicks: Int
    
    override init() {
        self.incrementStep = TTDefaultValue.IncrementStep
        self.maxNumberOfClicks = TTDefaultValue.MaxNumberOfClicks
        super.init()
    }
    
    //MARK:- Equatable
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? TTSettings else {
            return false
        }
        return self.incrementStep == object.incrementStep && self.maxNumberOfClicks == object.maxNumberOfClicks
    }
    
    //MARK:- NSCoding
    required init?(coder aDecoder: NSCoder) {
        self.incrementStep = aDecoder.decodeInteger(forKey: NSStringFromSelector(#selector(getter: incrementStep)))
        self.maxNumberOfClicks = aDecoder.decodeInteger(forKey: NSStringFromSelector(#selector(getter: maxNumberOfClicks)))
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.incrementStep, forKey: NSStringFromSelector(#selector(getter: incrementStep)))
        aCoder.encode(self.maxNumberOfClicks, forKey: NSStringFromSelector(#selector(getter: maxNumberOfClicks)))
    }
}
