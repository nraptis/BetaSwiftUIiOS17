//
//  Page1View.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import SwiftUI

struct Page1View: View {
    
    @Environment(Page1ViewModel.self) var page1ViewModel: Page1ViewModel
    @Environment(Router.self) var router: Router
    var body: some View {
        @Bindable var router = router
        return List() {
            HStack {
                Button(action: {
                    router.showFullScreenCalendar()
                }, label: {
                    ZStack {
                        HStack {
                            Spacer()
                            Image(systemName: page1ViewModel.webContent1)
                                .font(.system(size: 56.0))
                                .foregroundStyle(Color.white)
                            Spacer()
                        }
                    }
                    .frame(height: 82.0)
                    .background(RoundedRectangle(cornerRadius: 12.0).foregroundStyle(.thinMaterial))
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                    .frame(width: 8.0)
                
                Button(action: {
                    router.showFullScreenNamed()
                }, label: {
                    ZStack {
                        HStack {
                            Spacer()
                            Image(systemName: page1ViewModel.webContent2)
                                .font(.system(size: 56.0))
                                .foregroundStyle(Color.white)
                            Spacer()
                        }
                    }
                    .frame(height: 82.0)
                    .background(RoundedRectangle(cornerRadius: 12.0).foregroundStyle(.thinMaterial))
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.top, 4.0)
            
            
            ForEach(page1ViewModel.page1Models)  { page1Model in
                Button(action: {
                    page1ViewModel.selectModelIntent(page1Model: page1Model)
                }, label: {
                    Text(page1Model.name)
                        .foregroundStyle(Color.white)
                        .font(.body.bold())
                })
            }
            
            UUIDView(uuid: router.uuid1)
            
            Button(action: {
                router.pushPage1A()
            }, label: {
                Text("Push Another Page 1")
                    .foregroundStyle(Color.white)
                    .font(.body.bold())
            })
        }
        .refreshable {
            await page1ViewModel.refresh()
        }
        .navigationTitle("Page 1")
        //.id(router.uuid1)
        
    }
}

#Preview {
    Page1View()
        .environment(Page1ViewModel.mock())
        .environment(Router.mock())
    
}
