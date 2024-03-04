//
//  CustomTheme.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct ThemeKey: EnvironmentKey {
    static var defaultValue: Theme = ThemeMonoPink()
}

extension EnvironmentValues {
    var customTheme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

extension View {
    func theme(_ theme: Theme) -> some View {
        environment(\.customTheme, theme) // return 생략됨
    }
}
