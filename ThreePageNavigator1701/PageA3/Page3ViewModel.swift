//
//  Page3ViewModel.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import Foundation
import Observation

@Observable class Page3ViewModel {
    
    static func mock() -> Page3ViewModel {
        Page3ViewModel(router: .mock(),
                        page2ViewModel: .mock(),
                        page1Model: .mock(),
                        page2Model: .mock())
    }
    
    let router: Router
    let page2ViewModel: Page2ViewModel
    let page1Model: Page1Model
    let page2Model: Page2Model
    
    
    
    init(router: Router, page2ViewModel: Page2ViewModel, page1Model: Page1Model, page2Model: Page2Model) {
        self.router = router
        self.page2ViewModel = page2ViewModel
        self.page1Model = page1Model
        self.page2Model = page2Model
        print("[Lifecycle] Page3ViewModel Created")
    }
    
    deinit {
        print("[Lifecycle] Page3ViewModel Destroyed")
    }

}

extension Page3ViewModel: Hashable {
    static func == (lhs: Page3ViewModel, rhs: Page3ViewModel) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
