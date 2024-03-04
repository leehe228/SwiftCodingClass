//
//  ThemeView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct ThemeView: View {
    
    @State private var theme: Theme = ThemeDarkForest()
    
    var body: some View {
        VStack {
            ThemeChildView()
                .environment(\.customTheme, theme)
            
            HStack {
                Circle()
                    .fill(ThemeDarkForest().background)
                    .frame(width: 50)
                    .onTapGesture {
                        theme = ThemeDarkForest()
                    }
                
                Circle()
                    .fill(ThemeMonoPink().background)
                    .frame(width: 50)
                    .onTapGesture {
                        theme = ThemeMonoPink()
                    }
            }
        }
    }
}

#Preview {
    ThemeView()
}
