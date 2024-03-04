//
//  PagingView.swift
//  SCC2
//
//  Created by Hoeun Lee on 11/21/23.
//

import SwiftUI

struct PagingView: View {
    @Binding var profiles: [Profile]
    
    var body: some View {
        TabView {
            ForEach(profiles) { profile in
                PageItem(profile: profile, profileImageLink: profile.profileImageLink, name: profile.name, groupName: profile.groupName)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    @State var profiles: [Profile] = [
        Profile(name: "Hoeun Lee", groupName: "Konkuk Univ. CSE 20.", description: "Studying iOS & DRL", profileImageLink: "https://avatars.githubusercontent.com/u/37548919?v=4", email: "leehe228@konkuk.ac.kr"),
        Profile(name: "Amo33", groupName: "Hangyang Univ. CSE 20.", description: "ML Engineering", profileImageLink: "https://avatars.githubusercontent.com/u/99354933?v=4", email: "amo33@naver.com")
    ]
    
    return Group {
        PagingView(profiles: $profiles)
    }
}

struct PageItem: View {
    
    @State var profile: Profile
    let profileImageLink: String
    let name: String
    let groupName: String
    @State private var isProfileViewPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: profileImageLink)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                } placeholder: {
                    ProgressView()
                }
                .background(Color.gray)
                .cornerRadius(65)
                .onTapGesture {
                    isProfileViewPresented = true
                }
                .sheet(isPresented: $isProfileViewPresented, content: {
                    ProfileCardView2(isPresented: $isProfileViewPresented, profile: profile)
                })
            
            Text(name)
                .font(.title3)
                .bold()
            Text(groupName)
        }
    }
}
