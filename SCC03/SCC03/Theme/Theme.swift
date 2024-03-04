//
//  Theme.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

protocol Theme {
    var background: Color { get }
    var title: Color { get }
    var subtitle: Color { get }
}

struct ThemeMonoPink: Theme {
    var background: Color = Color("MonoPink/background", bundle: nil)
    var title: Color = Color("MonoPink/title", bundle: nil)
    var subtitle: Color = Color("MonoPink/subtitle", bundle: nil)
}

struct ThemeDarkForest: Theme {
    var background: Color = Color("DarkForest/background", bundle: nil)
    var title: Color = Color("DarkForest/title", bundle: nil)
    var subtitle: Color = Color("DarkForest/subtitle", bundle: nil)
}
