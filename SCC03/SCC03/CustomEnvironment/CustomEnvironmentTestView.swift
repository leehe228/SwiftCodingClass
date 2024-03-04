//
//  CustomEnvironmentTestView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct CustomEnvironmentTestView: View {
    
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            CustomEnvironmentTestChildView()
            
            CustomEnvironmentTestChildView()
                .environment(\.customCounter, count)
            
            HStack {
                Button("+") {
                    count += 1
                }
                .buttonStyle(.borderedProminent)
                Button("-") {
                    count -= 1
                }
                .buttonStyle(.borderedProminent)
            }
        }
        // .environment(\.customCounter, count)
    }
}

#Preview {
    CustomEnvironmentTestView()
}
