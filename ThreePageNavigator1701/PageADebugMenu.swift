//
//  PageADebugMenu.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import SwiftUI

struct PageADebugMenu: View {
    
    @Environment(Router.self) var router: Router
    var body: some View {
        
        return VStack(spacing: 0.0) {
            HStack {
                VStack {
                    HStack {
                        Button(action: {
                            router.pushPage1A()
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Push Page 1")
                                    .font(.caption)
                                    .foregroundStyle(Color.white)
                                    .padding(.vertical, 8.0)
                                
                                Spacer()
                            }
                        })
                        .buttonStyle(.borderedProminent)
                    }
                    HStack {
                        Button(action: {
                            router.refreshPage1()
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Refresh Page 1")
                                    .font(.caption)
                                    .foregroundStyle(Color.white)
                                    .padding(.vertical, 8.0)
                                Spacer()
                            }
                        })
                        .buttonStyle(.borderedProminent)
                        Button(action: {
                            router.refreshPage2()
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Refresh Page 2")
                                    .font(.caption)
                                    .foregroundStyle(Color.white)
                                    .padding(.vertical, 8.0)
                                Spacer()
                            }
                        })
                        .buttonStyle(.borderedProminent)
                    }
                    HStack {
                        Button(action: {
                            router.refreshPage3()
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Refresh Page 3")
                                    .font(.caption)
                                    .foregroundStyle(Color.white)
                                    .padding(.vertical, 8.0)
                                Spacer()
                            }
                        })
                        .buttonStyle(.borderedProminent)
                        Button(action: {
                            router.refreshRoot()
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Refresh Root")
                                    .font(.caption)
                                    .foregroundStyle(Color.white)
                                    .padding(.vertical, 8.0)
                                Spacer()
                            }
                        })
                        .buttonStyle(.borderedProminent)
                    }
                }
                .padding(.horizontal, 12.0)
                .padding(.vertical, 6.0)
            }
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .padding(.horizontal, 16.0)
            .padding(.bottom, 8.0)
            .padding(.top, 8.0)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    PageADebugMenu()
        .environment(Router.mock())
}
