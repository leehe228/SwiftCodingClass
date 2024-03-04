//
//  ThemeChildView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct ThemeChildView: View {
    
    @Environment(\.customTheme) var themeColor
    
    var body: some View {
        VStack {
            Text("title")
                .foregroundStyle(themeColor.title)
                .font(.title)
            Text("subtitle")
                .foregroundStyle(themeColor.subtitle)
                .font(.title2)
        }
        .frame(width: 200, height: 200)
        .background(themeColor.background)
    }
}

#Preview {
    ThemeChildView()
}
