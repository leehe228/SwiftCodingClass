//
//  PasswordView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct PasswordView: View {
    
    // 주입된 environmentObject를 사용할 수 있음
    // Environment Object는 Optional로 선언이 안됨
    // 옳은 상위 위치에서 EnvironmentObject를 정의해주어야 앱이 clash나지 않는다
    @EnvironmentObject var flowObject: RootFlowObject
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("회원가입")
                .font(.title)
                .bold()
            
            TextField("비밀번호 입력", text: $password)
                .border(Color.black)
                .padding()
            
            Button("다음") {
                // 홈 화면으로 이동
                flowObject.viewType = .home
            }
            .buttonStyle(.borderedProminent)
            .disabled(password.isEmpty)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange)
    }
}

#Preview {
    PasswordView()
}
