//
//  Helpers.swift
//
//  Created by Vladimir Goncharov on 30/07/2017.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

//MARK:- RawRepresentable as Int
extension RawRepresentable where Self.RawValue == Int {
    
    /// Return all available enums. The enum values must be consistent
    ///
    /// - Parameter startIndex: Value of the first element of enum
    /// - Returns: The list of enums
    static func allCases(_ startIndex: Int = 0) -> [Self] {
        var i = startIndex
        return Array( AnyIterator {
            let instance = self.init(rawValue: i)
            i += 1
            return instance
        })
    }
}

//MARK: - Environment
func GetEnvironment(key: String) -> String? {
    let environments = ProcessInfo.processInfo.environment
    return environments[key]
}

//MARK: -
protocol CellProtocol {
    var cellClass: AnyClass { get }
}

extension CellProtocol {
    var identifier: String {
        return String(describing: self.cellClass)
    }
    
    var nib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
