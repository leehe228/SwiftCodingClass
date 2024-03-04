//
//  HomeView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var flowObject: RootFlowObject
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack {
                Text("환영합니다! 홈화면!")
                
                Button("로그아웃") {
                    // register view로 이동
                    flowObject.viewType = .register
                }
                .buttonStyle(.borderedProminent)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    // environment Object가 없이 Preview에서 접근하거나 사용하면 Clash 발생
    HomeView()
        .environmentObject(RootFlowObject())
    // 다른 뷰랑 공유되는 Object가 아닌 Preview 보여줄 때만 사용되는 Object이다
}
