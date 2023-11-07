//
//  BindingTestView.swift
//  DataFlow
//
//  Created by framiOS on 2023/10/23.
//

import SwiftUI

struct BindingTestView: View {
    @State private var content: String = ""
    @State private var isBottomSheetShow: Bool = false
    
    var body: some View {
        let _ = print("🌗 Current Type::: \(type(of: self)), \(content)🌓")
        VStack {
            if content.isEmpty {
                Text("버튼을 눌러 문구를 입력해 주세요.")
                    .foregroundStyle(.gray)
            }
            
            Text(content)
            
            HStack {
                Spacer()
                Button("수정") {
                    isBottomSheetShow.toggle()
                }
                .buttonStyle(.borderedProminent)
            } //: HStack
        } //: VStack
        .padding(.horizontal, 20)
        .sheet(isPresented: $isBottomSheetShow, content: {
            InputView(content: $content, isSelfShow: $isBottomSheetShow)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        })
        
    }
}

struct InputView: View {
    @Binding var content: String
    @Binding var isSelfShow: Bool
    
    var body: some View {
        VStack {
            TextField(content.isEmpty ?
                      "문구를 입력해 주세요" : content
                      , text: $content)
            
            Button("완료") {
                isSelfShow.toggle()
            }
            .buttonStyle(.borderedProminent)
        } //: VStack
        .padding(.horizontal, 20)
    }
}

#Preview {
    BindingTestView()
}
