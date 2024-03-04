//
//  RegisterView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var id: String = ""
    
    var body: some View {
        VStack {
            Text("회원가입 화면입니다")
                .font(.title)
                .bold()
            
            TextField("id 입력", text: $id)
                .border(Color.black)
                .padding()
            
            NavigationLink {
                // 이동할 뷰
                PasswordView()
            } label: {
                Text("다음")
            }
            .disabled(id.isEmpty)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.yellow)
    }
}

#Preview {
    NavigationStack {
        RegisterView()
    }
    
}
