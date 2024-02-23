//
//  Page1ViewModel.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import Foundation
import Observation

@Observable class Page1ViewModel {
    
    static func mock() -> Page1ViewModel {
        Page1ViewModel(router: .mock())
    }
    
    var webContent1 = "calendar"
    var webContent2 = "person.fill.checkmark"
    
    
    let router: Router
    var page1Models: [Page1Model]
    private weak var stressTimer: Timer?
    init(router: Router) {
        self.router = router
        page1Models = [.init(name: Page1Model.randomName(), id: 0),
                        .init(name: Page1Model.randomName(), id: 1),
                        .init(name: Page1Model.randomName(), id: 2),
                        .init(name: Page1Model.randomName(), id: 3)]
        print("[Lifecycle] Page1ViewModel Created")
        
        stressTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { [weak self] _ in
            if Bool.random() {
                if Bool.random() {
                    self?.webContent1 = "calendar"
                } else {
                    self?.webContent1 = "calendar.badge.exclamationmark"
                }
            } else {
                if Bool.random() {
                    self?.webContent2 = "person.fill.checkmark"
                } else {
                    self?.webContent2 = "person.fill.questionmark"
                }
            }
        })
    }
    
    deinit {
        print("[Lifecycle] Page1ViewModel Destroyed")
    }
    
    func selectModelIntent(page1Model: Page1Model) {
        router.pushPage2A(page1ViewModel: self, page1Model: page1Model)
    }
    
    var modelID = 4
    func refresh() async {
        
        try? await Task.sleep(nanoseconds: 1_500_000_000)
        
        let count = Int.random(in: 2...10)
        
        page1Models.removeAll(keepingCapacity: true)
        for _ in 0..<count {
            page1Models.append(.init(name: Page1Model.randomName(), id: modelID))
            modelID += 1
        }
    }
}

extension Page1ViewModel: Hashable {
    static func == (lhs: Page1ViewModel, rhs: Page1ViewModel) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
