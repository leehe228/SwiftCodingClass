//
//  ProfileCardListView.swift
//  SCC2
//
//  Created by Hoeun Lee on 11/21/23.
//

import SwiftUI

struct ProfileCardListView: View {
    
    @Binding var profiles: [Profile]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(profiles) { profile in
                    NavigationLink(destination: ProfileCardView(profile: profile)) {
                        Text("Profile of \"\(profile.name)\"")
                    }
                }
            }
            .navigationTitle("Profiles")
        }
    }
}


