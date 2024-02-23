//
//  Router.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import Foundation
import Observation
import SwiftUI

@Observable class Router {
    
    var navigationPath = NavigationPath()
    
    var uuid1 = UUID()
    var uuid2 = UUID()
    var uuid3 = UUID()
    
    static func mock() -> Router {
        Router(rootViewModel: .mock())
        //Router()
    }
    
    private var stressTimer: Timer?
    
    let rootViewModel: RootViewModel
    init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
        
        stressTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            var event = Int.random(in: 0...4)
            if event == 0 {
                self.refreshRoot()
            }
            if event == 1 {
                self.refreshPage1()
            }
            if event == 2 {
                self.refreshPage2()
            }
            if event == 3 {
                self.refreshPage3()
            }
        })
    }
    
    // This is for the navigation root AKA landing page
    @ObservationIgnored lazy var page1ViewModel: Page1ViewModel = {
        Page1ViewModel(router: self)
    }()
    
    func pushPage1A() {
        let page1ViewModel = Page1ViewModel(router: self)
        navigationPath.append(page1ViewModel)
    }
    
    func pushPage2A(page1ViewModel: Page1ViewModel, page1Model: Page1Model) {
        let page2ViewModel = Page2ViewModel(router: self, page1ViewModel: page1ViewModel, page1Model: page1Model)
        navigationPath.append(page2ViewModel)
    }
    
    func pushPage3A(page2ViewModel: Page2ViewModel, page1Model: Page1Model, page2Model: Page2Model) {
        let page3ViewModel = Page3ViewModel(router: self,
                                              page2ViewModel: page2ViewModel,
                                              page1Model: page1Model,
                                              page2Model: page2Model)
        navigationPath.append(page3ViewModel)
    }
    
    func refreshPage1() {
        uuid1 = UUID()
    }

    func refreshPage2() {
        uuid2 = UUID()
    }

    func refreshPage3() {
        uuid3 = UUID()
    }
    
    func refreshRoot() {
        //rootViewModel.refresh()
    }
    
    func showFullScreenCalendar() {
        rootViewModel.activeFullScreen = .calendar
    }
    
    func showFullScreenNamed() {
        rootViewModel.activeFullScreen = .names
    }
    
}
