//
//  FullScreenPicker.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/23/24.
//

import SwiftUI

struct FullScreenNameChooser: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(RootViewModel.self) var rootViewModel: RootViewModel
    var names = ["Steve", "Mark", "Bill", "Sam"]
    
    
    var body: some View {
        @Bindable var rootViewModel = rootViewModel
        return NavigationStack {
            VStack {
                Picker("Name", selection: $rootViewModel.selectedName) {
                    ForEach(names, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(role: .destructive) { dismiss() } label: {
                        Text("Done")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Choose Name")
                }
            }
        }
    }
}

#Preview {
    FullScreenNameChooser()
        .environment(RootViewModel.mock())
}
