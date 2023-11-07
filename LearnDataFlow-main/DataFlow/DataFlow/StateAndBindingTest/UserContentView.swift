//
//  UserContentView.swift
//  DataFlow
//
//  Created by framiOS on 2023/10/23.
//

import SwiftUI

struct UserContentView: View {
    
    @State private var name: String = "tester1"
    @State private var age: Int = 0
    @State private var favoritColor: Color = .gray
    
    var body: some View {
        UserCardView(name: $name, age: $age, favoritColor: $favoritColor)
        NameInputView(text: $name)
        AgeControlView(count: $age)
        ColorPalletView(favoriateColor: $favoritColor)
    }
}

struct NameInputView: View {
    
    @Binding var text: String
    @State private var inputText: String = ""
    
    var body: some View {
        HStack {
            TextField("이름 변경", text: $inputText)
            Button("이름 변경") {
                text = inputText
            }
                .buttonStyle(.borderedProminent)
        }
        .padding(.horizontal, 20)
    }
}

struct AgeControlView: View {
    
    @Binding var count: Int
    
    var body: some View {
        HStack {
            Button("-") {
                count -= 1
            }
            .buttonStyle(.bordered)
            
            Text("\(count)")
                .frame(width: 100)
            
            Button("+") {
                count += 1
            }
            .buttonStyle(.bordered)
            
        }
    }
}

struct ColorPalletView: View {
    
    let colors: [Color] = [
        .red, .orange, .yellow, .green, .blue, .purple, .pink, .brown, .white, .black
    ]
    @Binding var favoriateColor: Color
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(colors, id: \.self) { color in
                    Button {
                        favoriateColor = color
                    } label: {
                        Circle()
                            .stroke(.black, lineWidth: 2.0)
                            .fill(color)
                            .frame(width: 30)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    UserContentView()
}
