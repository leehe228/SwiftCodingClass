//
//  ContentView.swift
//  SCC2
//
//  Created by Hoeun Lee on 10/31/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var profiles: [Profile] = [
        Profile(name: "Hoeun Lee", groupName: "Konkuk Univ. CSE 20.", description: "Studying iOS & DRL", profileImageLink: "https://avatars.githubusercontent.com/u/37548919?v=4", email: "leehe228@konkuk.ac.kr"),
        Profile(name: "Amo33", groupName: "Hangyang Univ. CSE 20.", description: "ML Engineering", profileImageLink: "https://avatars.githubusercontent.com/u/99354933?v=4", email: "amo33@naver.com")
    ]
    
    var body: some View {
        TabView {
            ProfileCardListView(profiles: $profiles)
            .tabItem {
                Label("List", systemImage: "list.bullet")
            }
            
            PagingView(profiles: $profiles)
                .tabItem {
                    Label("Summary", systemImage: "book.pages")
                }
        }
        
    }
}

#Preview {
    ContentView()
}


