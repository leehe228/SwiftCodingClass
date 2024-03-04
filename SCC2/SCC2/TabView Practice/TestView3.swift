//
//  TestView3.swift
//  SCC2
//
//  Created by Hoeun Lee on 11/21/23.
//

import SwiftUI

struct TestView3: View {
    var body: some View {
        ScrollView {
            ForEach(1..<10) { i in
                Text("\(i)단")
                    .font(.headline)
                ForEach(1..<10) { j in
                    Text("\(i) × \(j) = \(i * j)")
                }
                HStack {
                    Text("\n")
                    Spacer()
                }
            }
        }
        .padding()
    }
}

#Preview {
    TestView3()
}
