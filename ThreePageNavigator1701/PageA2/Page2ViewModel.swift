//
//  Page2ViewModel.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import Foundation
import Observation

@Observable class Page2ViewModel {
    
    static func mock() -> Page2ViewModel {
        Page2ViewModel(router: .mock(),
                        page1ViewModel: .mock(),
                        page1Model: .mock())
    }
    
    let router: Router
    let page1Model: Page1Model
    let page1ViewModel: Page1ViewModel
    var page2Models: [Page2Model]
    init(router: Router, page1ViewModel: Page1ViewModel, page1Model: Page1Model) {
        self.router = router
        self.page1ViewModel = page1ViewModel
        self.page1Model = page1Model
        page2Models = [.init(age: 20, id: 0),
                        .init(age: 25, id: 1),
                        .init(age: 30, id: 2),
                        .init(age: 35, id: 3)]
        print("[Lifecycle] Page2ViewModel Created")
    }
    
    deinit {
        print("[Lifecycle] Page2ViewModel Destroyed")
    }
    
    func selectModelIntent(page2Model: Page2Model) {
        print("[User Action] Page2Model (\(page2Model.age)) Selected")
        router.pushPage3A(page2ViewModel: self,
                           page1Model: page1Model,
                           page2Model: page2Model)
    }
}

extension Page2ViewModel: Hashable {
    static func == (lhs: Page2ViewModel, rhs: Page2ViewModel) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
