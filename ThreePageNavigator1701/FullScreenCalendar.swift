//
//  FullScreenCalendar.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/23/24.
//

import SwiftUI

struct FullScreenCalendar: View {
    @Environment(RootViewModel.self) var rootViewModel: RootViewModel
    var body: some View {
        @Bindable var rootViewModel = rootViewModel
        return VStack {
            DatePicker("Date",
                       selection: $rootViewModel.selectedDate,
                       displayedComponents: [.date])
            .datePickerStyle(.graphical)
            Spacer()
        }
    }
}

#Preview {
    FullScreenCalendar()
        .environment(RootViewModel.mock())
}
