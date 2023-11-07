//
//  SCC2App.swift
//  SCC2
//
//  Created by Hoeun Lee on 10/31/23.
//

import SwiftUI

@main
struct SCC2App: App {
    var body: some Scene {
        WindowGroup {
            ScrollView {
                GroupBox {
                    ProfileCardView(name: "Hoeun Lee", groupName: "Konkuk Univ. CSE 20.", description: "Studying iOS & DRL", profileImageLink: "https://avatars.githubusercontent.com/u/37548919?v=4")
                }
                .cornerRadius(10)
                
                GroupBox {
                    ProfileCardView(name: "Amo33", groupName: "Hangyang Univ. CSE 20.", description: "ML Engineering", profileImageLink: "https://avatars.githubusercontent.com/u/99354933?v=4")
                }
                .cornerRadius(10)
            }
            .padding()
        }
    }
}
