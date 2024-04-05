//
//  Array+Extension.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 05/04/2024.
//

import Foundation


extension Array where Element: Equatable {
    func all(where predicate: (Element) -> Bool) -> [Element] {
        return self.compactMap { predicate($0) ? $0 : nil }
    }
}

