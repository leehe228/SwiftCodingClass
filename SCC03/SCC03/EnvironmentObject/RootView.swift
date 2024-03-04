//
//  RootView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct RootView: View {
    
    // StateObject는 뷰의 Life Cycle을 따라감
    // ObservedObject보다 안전하게 관리될 수 있음
    @StateObject private var flowObject = RootFlowObject()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black.ignoresSafeArea()
            
            switch flowObject.viewType {
            case .splash:
                SplashView()
                    .onAppear {
                        // onAppear 후 2초 이후 viewType을 register로 변경
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            flowObject.viewType = .register
                        }
                    }
            case .register:
                NavigationStack {
                    RegisterView()
                }
                // navigation Stack에 넣어주어야 RegisterView에서 NavigationLink로 열리는 PasswordView에서도 주입한 Environment에서 접근이 가능
                // NavigationStack은 내부가 아닌 Stack에 environment 주입
                .environmentObject(flowObject)
            case .home:
                HomeView()
                    .environmentObject(flowObject)
                // homeView에서 변경이 되어도 RootView에서 State Object로 갖고 있기 때문에
                // 하위 모든 뷰에서 접근이 가능하다
            }
        }
    }
}

#Preview {
    RootView()
}
