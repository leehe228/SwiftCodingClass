//
//  DismissTestView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct DismissTestView: View {
    
    @State private var isShow: Bool = false
    
    var body: some View {
        /* ZStack {
            Button("present child") {
                isShow.toggle()
            }
            
            if isShow {
                DismissTestChildView(isSelfShow: $isShow)
            }
        }*/
        Button("present child") {
            isShow.toggle()
        }
        .fullScreenCover(isPresented: $isShow, content: {
            DismissTestChildView()
        })
    }
}

#Preview {
    DismissTestView()
}

struct DismissTestChildView: View {
    
    // @Binding var isSelfShow: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            Button("dismiss button") {
                // isSelfShow.toggle()
                dismiss()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    // DismissTestChildView(isSelfShow: .constant(true))
    DismissTestChildView()
}
