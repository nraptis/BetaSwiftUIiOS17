//
//  Page2View.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import SwiftUI

struct Page2View: View {
    @Environment(Page2ViewModel.self) var page2ViewModel: Page2ViewModel
    @Environment(Router.self) var router: Router
    
    var body: some View {
        @Bindable var router = router
        return List() {
            
            ForEach(page2ViewModel.page2Models) { page2Model in
                Button(action: {
                    page2ViewModel.selectModelIntent(page2Model: page2Model)
                }, label: {
                    Text("\(page2Model.age)")
                        .foregroundStyle(Color.white)
                        .font(.body.bold())
                })
            }
            
            
            UUIDView(uuid: router.uuid2)
            
            Button(action: {
                router.pushPage1A()
            }, label: {
                Text("Push Another Page 1")
                    .foregroundStyle(Color.white)
                    .font(.body.bold())
            })
            
        }
        //.id(router.uuid2)
        .navigationTitle(page2ViewModel.page1Model.name)
    }
}

#Preview {
    Page2View()
        .environment(Page2ViewModel.mock())
        .environment(Router.mock())
}
