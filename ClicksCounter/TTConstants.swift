//
//  TTConstants.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import Foundation

//MARK:- Default values
enum TTDefaultValue {
    static let NumberOfClicks       = 0
    static let IncrementStep        = 1
    static let MaxNumberOfClicks    = 100
}

//MARK:- Limitations
enum TTMinValue {
    static let IncrementStep        = 1
    static let NumberOfClicks       = 1
}

enum TTMaxValue {
    static let IncrementStep       = 100000000
    static let NumberOfClicks      = 100000000
}

//MARK:- Tests
enum TTLaunchEnvironmentKey {
    static let StartStoryboard              = "__startStoryboardScreen__"   //value is String
    
    static let AnimationsEnabled            = "__AnimationsEnabled__"       //value is AnimationsEnabledValue
    enum AnimationsEnabledValue {
        static let YES = "__YES"
        static let NO = "__NO"
    }
}
