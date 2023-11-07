//
//  StateTestView.swift
//  DataFlow
//
//  Created by framiOS on 2023/10/23.
//

import SwiftUI

struct StateTestView: View {
    // Dependency
    @State private var count: Int = 0
    
    // Body Property
    var body: some View {
        HStack {
            Spacer()
            
            Button("-") {
                count -= 1
            }
            .buttonStyle(.borderedProminent)
            
            Text("\(count)")
                .frame(width: 100)
            
            Button("+") {
                count += 1
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        } //: HStack
    } //: body
}

#Preview {
    StateTestView()
}
