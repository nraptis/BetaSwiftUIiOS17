//
//  ThreePageNavigator1701App.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import SwiftUI

@main
struct ThreePageNavigator1701App: App {
    @State var rootViewModel: RootViewModel
    @State var router: Router
    
    //@State var router = Router()
    
    init() {
        let _rootViewModel = RootViewModel()
        let _router = Router(rootViewModel: _rootViewModel)
        self._rootViewModel = State(wrappedValue: _rootViewModel)
        self._router = State(wrappedValue: _router)
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(rootViewModel)
                .environment(router)
        }
    }
}
