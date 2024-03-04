//
//  TabViewTestView.swift
//  SCC2
//
//  Created by Hoeun Lee on 11/21/23.
//

import SwiftUI

struct TabViewTestView: View {
    var body: some View {
        TabView {
            Text("Tab1")
                .tabItem {
                    // Label("item1", systemImage: "bolt")
                    Image(systemName: "bolt")
                    Text("item1")
                }
            Text("Tab2")
                .tabItem {
                    Label("item2", systemImage: "heart")
                }
        }
    }
}

#Preview {
    TabViewTestView()
}
