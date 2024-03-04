//
//  EditView.swift
//  SCC2
//
//  Created by Hoeun Lee on 11/14/23.
//

import SwiftUI

struct EditView: View {
    
    // Environment
    @Environment(\.dismiss) var dismiss
    @Binding var profile: Profile
    @State private var name: String = ""
    @State private var groupName: String = ""
    @State private var description: String = ""
    @State private var profileImageLink: String = ""
    
    var body: some View {
        List {
            Section("이름") {
                TextField("이름을 입력하세요", text: $name)
            }
            Section("소속") {
                TextField("소속을 입력하세요", text: $groupName)
            }
            Section("설명") {
                TextField("설명을 입력하세요", text: $description)
            }
            Section("이미지 프로필 링크") {
                HStack {
                    AsyncImage(url: URL(string: profileImageLink)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 20, height: 20)
                        .background(Color.gray)
                        .cornerRadius(10)
                    TextField("프로필 이미지 링크를 입력하세요", text: $profileImageLink)
                }
            }
        }
        .navigationTitle("프로필 수정")
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading, content: {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.accentColor)
                }
            })

            ToolbarItemGroup(placement: .topBarTrailing, content: {
                Button("저장") {
                    profile.name = name
                    profile.groupName = groupName
                    profile.description = description
                    profile.profileImageLink = profileImageLink
                    dismiss()
                }
                .disabled((name == "" || groupName == "" || description == "" || profileImageLink == "") || (name == profile.name && groupName == profile.groupName && description == profile.description && profileImageLink == profile.profileImageLink))
            })
        }
        .onAppear {
            name = profile.name
            groupName = profile.groupName
            description = profile.description
            profileImageLink = profile.profileImageLink
        }
    }
}

#Preview {
    Text("")
        .sheet(isPresented: .constant(true), content: {
            NavigationStack {
                EditView(profile: .constant(Profile(name: "Hoeun Lee", groupName: "Konkuk Univ. CSE 20.", description: "Studying iOS & DRL", profileImageLink: "https://avatars.githubusercontent.com/u/37548919?v=4", email: "leehe228@konkuk.ac.kr")))
            }
        })
}
