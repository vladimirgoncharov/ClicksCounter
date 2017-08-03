//
//  UITestHelpers.swift
//  ClicksCounter
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import XCTest

@available(iOS 9, *)
extension XCUIApplication {
    
    func launchWithTestEnvironment(env: [String : String] = ProcessInfo.processInfo.environment) {
        self.launchEnvironment = env
        self.launch()
    }
}

extension XCUIElement {
    /**
     Removes any current text in the field before typing in the new value
     - Parameter text: the text to enter into the field
     */
    func clearAndEnterText(text: String, for app: XCUIApplication) {
        self.forceTapElement()
        if let stringValue = self.value as? String {
            let deleteString = stringValue.characters.map { _ in XCUIKeyboardKeyDelete }.joined(separator: "")
            self.typeText(deleteString)
        }
        self.typeText(text)
    }
}

extension XCUIElement {
    
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
            coordinate.tap()
        }
    }
}
