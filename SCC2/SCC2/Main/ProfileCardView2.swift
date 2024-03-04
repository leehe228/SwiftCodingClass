//
//  ProfileCardView2.swift
//  SCC2
//
//  Created by Hoeun Lee on 11/21/23.
//

import SwiftUI

struct ProfileCardView2: View {
    
    @Binding var isPresented: Bool
    @State var profile: Profile
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    DetailTitleImageView(profile: profile, isPresented: $isPresented)
                    
                    VStack(alignment: .leading) {
                        
                        Spacer()
                            .frame(height: 10)
                        
                        Text(profile.description)
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                            .frame(height: 30)
                        
                        // 연락처 있는 경우
                        if profile.email != "" {
                            Text("이메일")
                                .font(.headline)
                                .bold()
                            
                            Spacer()
                                .frame(height: 10)
                            
                            Button {
                                // 전화 걸기
                                let formattedString = "mailto:" + profile.email
                                print(formattedString)
                                guard let mailUrl = URL(string: formattedString) else { return }
                                UIApplication.shared.open(mailUrl)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .fill(Color("Background1"))
                                        .stroke(Color("Stroke1"), lineWidth: 1)
                                    
                                    HStack {
                                        Spacer()
                                            .frame(width: 15)
                                        
                                        Image(systemName: "envelope.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 24, height: 24)
                                            .foregroundStyle(Color("Foreground1"))
                                        
                                        Spacer()
                                            .frame(width: 10)
                                        
                                        Text(profile.email)
                                            .foregroundStyle(Color("Foreground1"))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(Color("Foreground1"))
                                        
                                        Spacer()
                                            .frame(width: 10)
                                    }
                                }
                                .frame(height: 48)
                            }
                            
                            Spacer()
                                .frame(height: 30)
                        }
                        
                    } // End of VStack
                    .padding(12)
                    
                } // End of ScrollView
                .padding(0)
                
            } // End of VStack
            .padding(0)
        }
    }
}

#Preview {
    ProfileCardView2(isPresented: .constant(true), profile: Profile(name: "Hoeun Lee", groupName: "Konkuk Univ. CSE 20.", description: "Studying iOS & DRL", profileImageLink: "https://avatars.githubusercontent.com/u/37548919?v=4", email: "leehe228@konkuk.ac.kr"))
}

struct DetailTitleImageView: View {
    
    // Environment
    @Environment(\.dismiss) var dismiss
    @State var profile: Profile
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: profile.profileImageLink)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .background(Color.gray)
            .clipped()
            
            // 그라데이션
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 120)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: .black.opacity(0), location: 0.06),
                            Gradient.Stop(color: .black.opacity(0.8), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                    )
                )
            
            VStack(alignment: .leading) {
                HStack {
                    // 저장 버튼
                    /* Button {
                        storeData.updateSaved()
                    } label: {
                        if let saved = storeData.isSaved {
                            Image(systemName: saved ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                        } else {
                            Image(systemName: "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                        }
                    } */
                    
                    Spacer()
                    
                    Button {
                        self.isPresented = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                        .frame(width: 20)
                    
                    Text("\(profile.name)")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 4)
                
                HStack {
                    
                    Spacer()
                        .frame(width: 20)
                    
                    Text("\(profile.groupName)")
                        .font(.system(size: 14))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 20)
            }
        }
    }
}
