//
//  Page1Model.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import Foundation

struct Page1Model: Identifiable {
    
    static func mock() -> Page1Model {
        Page1Model(name: "foo", id: 0)
    }
    
    let name: String
    let id: Int
    
    static func randomName() -> String {
        let rand = Int.random(in: 0...6)
        if rand == 0 {
            return "Foo"
        } else if rand == 1 {
            return "Bar"
        } else if rand == 2 {
            return "FooBar"
        } else if rand == 3 {
            return "BarFoo"
        } else if rand == 4 {
            return "Bob"
        } else {
            return "Alice"
        }
    }
}

extension Page1Model: Equatable {
    static func ==(lhs: Page1Model, rhs: Page1Model) -> Bool {
        lhs.id == rhs.id
    }
}
