//
//  RootView.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import SwiftUI

struct RootView: View {
    
    @Environment(RootViewModel.self) var rootViewModel: RootViewModel
    @Environment(Router.self) var router: Router
    
    var body: some View {
        @Bindable var rootViewModel = rootViewModel
        return TabView {
            contentA()
                .badge(2)
                .tabItem {
                    Label("Section 1", systemImage: "a.square")
                }
            Color.green
                .tabItem {
                    Label("Section 2", systemImage: "b.square")
                }
        }
        .sheet(item: $rootViewModel.activeFullScreen) { fullScreenCover in
            switch fullScreenCover {
            case .calendar:
                FullScreenCalendar()
            case .names:
                FullScreenNameChooser()
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func contentA() -> some View {
        @Bindable var router = router
        return VStack {
            NavigationStack(path: $router.navigationPath) {
                Page1View()
                    .environment(router.page1ViewModel)
                    .navigationDestination(for: Page1ViewModel.self) { page1ViewModel in
                        Page1View()
                            .environment(page1ViewModel)
                    }
                    .navigationDestination(for: Page2ViewModel.self) { page2ViewModel in
                        Page2View()
                            .environment(page2ViewModel)
                    }
                    .navigationDestination(for: Page3ViewModel.self) { page3ViewModel in
                        Page3View()
                            .environment(page3ViewModel)
                    }
            }
            .environment(router)
        }
    }
    
}

#Preview {
    RootView()
        .environment(RootViewModel.mock())
}
