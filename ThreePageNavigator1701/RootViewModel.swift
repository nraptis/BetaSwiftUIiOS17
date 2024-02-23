//
//  RootViewModel.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/22/24.
//

import Foundation
import Observation

@Observable class RootViewModel {
    
    enum FullScreenCover: Identifiable {
        case calendar
        case names
        var id: Int {
            switch self {
            case .calendar:
                return 0
            case .names:
                return 1
            }
        }
    }
    
    var activeFullScreen: FullScreenCover?
    
    var uuid = UUID()
    
    static func mock() -> RootViewModel {
        RootViewModel()
    }
    
    func refresh() {
        uuid = UUID()
    }
    
    var selectedDate = Date()
    var selectedName = "Steve"
    
}
