//
//  Page3View.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import SwiftUI

struct Page3View: View {
    
    @Environment(Page3ViewModel.self) var page3ViewModel: Page3ViewModel
    @Environment(Router.self) var router: Router
    
    var body: some View {
        @Bindable var router = router
        return List() {
            
            HStack {
                Text("\(router.rootViewModel.selectedName)")
                    .foregroundStyle(Color.white)
                    .font(.body.bold())
            }
            
            HStack {
                Spacer()
                Image(systemName: "book")
                    .font(.system(size: 180.0))
                    .foregroundStyle(.regularMaterial)
                    .padding(.all, 16.0)
                Spacer()
            }
            
            UUIDView(uuid: router.uuid3)
            
            Button(action: {
                router.pushPage1A()
            }, label: {
                Text("Push Another Page 1")
                    .foregroundStyle(Color.white)
                    .font(.body.bold())
            })
        }
    }
    /*
    @Environment(Page3ViewModel.self) var page3ViewModel: Page3ViewModel
    @Environment(Router.self) var router: Router
    var body: some View {
        VStack(spacing: 0.0) {
            Spacer()
            Image(systemName: "book")
                .font(.system(size: 180.0))
                .foregroundStyle(.regularMaterial)
                .padding(.all, 16.0)
            Spacer()
            HStack {
                VStack {
                    HStack {
                        Text(router.uuid3.uuidString)
                            .font(.caption)
                            .foregroundStyle(Color.white)
                        Spacer()
                    }
                }
                .padding(.horizontal, 12.0)
                .padding(.vertical, 6.0)
            }
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .padding(.horizontal, 16.0)
        }
        .navigationTitle("\(page3ViewModel.page1Model.name), \(page3ViewModel.page2Model.age)")
    }
    */
}

#Preview {
    Page3View()
        .environment(Page3ViewModel.mock())
        .environment(Router.mock())
}
