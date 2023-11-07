//
//  UserCardView.swift
//  DataFlow
//
//  Created by framiOS on 2023/10/23.
//

import SwiftUI

struct UserCardView: View {
    
    // @Binding을 사용하지 않고 let 을 사용해도 가능 (값만 전달해줘도 되기 때문)
    @Binding var name: String
    @Binding var age: Int
    @Binding var favoritColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("이름 : ")
                    .font(.headline)
                Text(name)
            } //: HStack
            
            HStack {
                Text("나이 : ")
                    .font(.headline)
                Text("\(age)")
            } //: HStack
            
            HStack {
                Text("색상 : ")
                    .font(.headline)
                Circle()
                    .stroke(.black, lineWidth: 2.0)
                    .fill(favoritColor)
                    .frame(width: 20)
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 20)
        .overlay(
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 2)
        )
    }
}

#Preview {
    UserCardView(name: .constant("tester1"), age: .constant(0), favoritColor: .constant(.gray))
}
