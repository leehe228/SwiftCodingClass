import SwiftUI

enum ButtonColor {
    case Gray
    case Red
    case Blue
    case Green
    case Yellow
    
    var color: Color {
        switch self {
        case .Gray:
            Color("OriginColor2")
        case .Red:
            Color("OriginColor1")
        case .Blue:
            Color("OriginColor5")
        case .Green:
            Color("OriginColor4")
        case .Yellow:
            Color("OriginColor3")
        }
    }
}

struct ProfileCardView: View {
    
    @State var profile: Profile
    
    @State private var counter: Int = 0
    @State private var shadowColor: Color = .gray
    @State private var infoPresented: Bool = false
    @State private var profileImageSize: Double = 150.0
    @State private var selectedButtonIndex: Int = 0
    
    let smallButtonSizeMax: CGFloat = 15
    let smallButtonSizeMin: CGFloat = 10
    
    @State private var isEditViewPresented: Bool = false
    
    var body: some View {
        
        // MARK: ScrollView
        ScrollView(content: {
            
            VStack(spacing: 0, content: {
                
                Slider(value: $profileImageSize, in: 100...200, step: 0.1)
                    .padding(.horizontal, 100)
                    .padding(.bottom, 20)
                
                AsyncImage(url: URL(string: profile.profileImageLink)) { image in
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
                
                Text(profile.name)
                    .font(.title)
                    .bold()
                
                Text(profile.groupName + "\n" + profile.description)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                
                Spacer()
                    .frame(height: 30)
                
                GroupBox {
                    HStack(alignment: .center, spacing: 15, content: {
                        
                        CircleButton(selectedButtonIndex: $selectedButtonIndex, shadowColor: $shadowColor, color: .gray)
                        CircleButton(selectedButtonIndex: $selectedButtonIndex, shadowColor: $shadowColor, color: .red)
                        CircleButton(selectedButtonIndex: $selectedButtonIndex, shadowColor: $shadowColor, color: .blue)
                        CircleButton(selectedButtonIndex: $selectedButtonIndex, shadowColor: $shadowColor, color: .green)
                        CircleButton(selectedButtonIndex: $selectedButtonIndex, shadowColor: $shadowColor, color: .yellow)
                        
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
                        
                        // ConfettiCannon(counter: $counter, num: 50)
                    }
                }
            })
        })
        .safeAreaPadding()
        .navigationTitle("프로필 뷰")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing, content: {
                Button {
                    isEditViewPresented = true
                } label: {
                    Image(systemName: "pencil")
                }
            })
        }
        .sheet(isPresented: $isEditViewPresented) {
            NavigationStack {
                EditView(profile: $profile)
            }
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    NavigationStack {
        ProfileCardView(profile: Profile(name: "Hoeun Lee", groupName: "Konkuk Univ. CSE 20.", description: "Studying iOS & DRL", profileImageLink: "https://avatars.githubusercontent.com/u/37548919?v=4", email: "leehe228@konkuk.ac.kr"))
    }
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

struct CircleButton: View {
    
    @Binding var selectedButtonIndex: Int
    @Binding var shadowColor: Color
    @State var color: Color
    
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                selectedButtonIndex = 0
                shadowColor = color
            }
        } label: {
            Circle()
                .foregroundColor(color)
                .frame(width: 15, height: 15)
                .shadow(color: color, radius: (selectedButtonIndex == 0 ? 3 : 0))
        }
    }
}

#Preview {
    CircleButton(selectedButtonIndex: .constant(0), shadowColor: .constant(Color.gray), color: .red)
}
