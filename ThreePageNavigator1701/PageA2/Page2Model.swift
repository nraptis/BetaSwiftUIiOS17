//
//  Page2Model.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import Foundation

struct Page2Model: Identifiable {
    
    static func mock() -> Page2Model {
        Page2Model(age: 20, id: 0)
    }
    
    let age: Int
    let id: Int
}
