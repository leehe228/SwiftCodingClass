//
//  Chapter4.swift
//  SCC-Ch1
//
//  Created by Hoeun Lee on 10/17/23.
//

import SwiftUI
import ConfettiSwiftUI

struct Chapter4: View {
    
    @State var counter: Int = 0
    @State var shadowColor: Color = .gray
    @State var buttonSize: [CGFloat] = [15, 10, 10, 10, 10]
    @State var infoPresented: Bool = false
    @State var profileImageSize: Double = 150.0
    
    var body: some View {
        
        // MARK: ScrollView
        ScrollView(content: {
            
            VStack(spacing: 0, content: {
                
                Slider(value: $profileImageSize, in: 100...200, step: 0.1)
                    .padding(.horizontal, 130)
                    .padding(.bottom, 20)
                
                AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/37548919?v=4")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: profileImageSize, height: profileImageSize)
                    .background(Color.gray)
                    .cornerRadius(65)
                    .shadow(color: shadowColor, radius: 10)
                
                Spacer()
                    .frame(height: 20)
                
                Text("Hoeun Lee")
                    .font(.title)
                    .bold()
                
                Text("Konkuk Univ. CSE 20.\nStudying iOS & DRL")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                
                Spacer()
                    .frame(height: 30)
                
                GroupBox {
                    HStack(alignment: .center, spacing: 15, content: {
                        Button {
                            withAnimation(.easeInOut) {
                                shadowColor = .gray
                                buttonSize[0] = 15
                                buttonSize[1] = 10
                                buttonSize[2] = 10
                                buttonSize[3] = 10
                                buttonSize[4] = 10
                            }
                        } label: {
                            Circle()
                                .foregroundColor(.gray)
                                .frame(width: buttonSize[0], height: buttonSize[0])
                        }
                        
                        Button {
                            withAnimation(.easeInOut) {
                                shadowColor = .red
                                buttonSize[0] = 10
                                buttonSize[1] = 15
                                buttonSize[2] = 10
                                buttonSize[3] = 10
                                buttonSize[4] = 10
                            }
                        } label: {
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: buttonSize[1], height: buttonSize[1])
                        }
                        
                        Button {
                            withAnimation(.easeInOut) {
                                shadowColor = .blue
                                buttonSize[0] = 10
                                buttonSize[1] = 10
                                buttonSize[2] = 15
                                buttonSize[3] = 10
                                buttonSize[4] = 10
                            }
                        } label: {
                            Circle()
                                .foregroundColor(.blue)
                                .frame(width: buttonSize[2], height: buttonSize[2])
                        }
                        
                        Button {
                            withAnimation(.easeInOut) {
                                shadowColor = .green
                                buttonSize[0] = 10
                                buttonSize[1] = 10
                                buttonSize[2] = 10
                                buttonSize[3] = 15
                                buttonSize[4] = 10
                            }
                        } label: {
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: buttonSize[3], height: buttonSize[3])
                        }
                        
                        Button {
                            withAnimation(.easeInOut) {
                                shadowColor = .yellow
                                buttonSize[0] = 10
                                buttonSize[1] = 10
                                buttonSize[2] = 10
                                buttonSize[3] = 10
                                buttonSize[4] = 15
                            }
                        } label: {
                            Circle()
                                .foregroundColor(.yellow)
                                .frame(width: buttonSize[4], height: buttonSize[4])
                        }
                    })
                }

                Spacer()
                    .frame(height: 10)
                
                Toggle(isOn: $infoPresented, label: {
                    Label("My Information", systemImage: "info.circle")
                        .font(.title3)
                        .bold()
                })
                .padding(.trailing, 3)
                .padding(.vertical, 20)
                
                if infoPresented {
                    Group {
                        InfoRow(iconImage: "birthday.cake", title: "Birthday", content: "Feb. 28. 2001.")
                        InfoRow(iconImage: "mail", title: "Email", content: "leehe228@konkuk.ac.kr")
                        InfoRow(iconImage: "globe", title: "Web Site", content: "deepdeepit.tistory.com")
                        InfoRow(iconImage: "globe", title: "My Github", content: "github.com/leehe228")
                        InfoRow(iconImage: "camera.aperture", title: "My Hobby", content: "Taking Photo")
                    }
                    .padding(.vertical, 4)
                    
                    Spacer()
                        .frame(height: 20)
                }
                
                Button {
                    counter += 1
                } label: {
                    ZStack {
                        Circle()
                            .frame(height: 60)
                            .foregroundColor(.white)
                            .shadow(radius: 1)
                        
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.gray)
                        
                        ConfettiCannon(counter: $counter, num: 50)
                    }
                }
            })
        })
        .safeAreaPadding()
    }
}

#Preview {
    Chapter4()
}

struct InfoRow:View {
    
    var iconImage: String
    var title: String
    var content: String
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Label(title, systemImage: iconImage)
                .font(.headline)
                .bold()
            GroupBox {
                HStack {
                    Text(content)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
            }
        })
    }
}

#Preview {
    Group {
        InfoRow(iconImage: "hare", title: "TITLE1", content: "CONTENT1")
        InfoRow(iconImage: "tortoise", title: "TITLE2", content: "CONTENT2")
            
    }
    .padding()
}

