//
//  UUIDView.swift
//  ThreePageNavigator1701
//
//  Created by Nicky Taylor on 2/23/24.
//

import SwiftUI

struct UUIDView: View {
    let uuid: UUID
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(uuid.uuidString)
                        .font(.caption)
                        .foregroundStyle(Color.white)
                    Spacer()
                }
            }
            .padding(.horizontal, 16.0)
            .padding(.vertical, 6.0)
        }
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12.0))
        .padding(.vertical, 8.0)
    }
}

#Preview {
    UUIDView(uuid: .init())
}
