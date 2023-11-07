//
//  CountControlView.swift
//  DataFlow
//
//  Created by zumin you on 2023/10/24.
//

import SwiftUI

struct CountControlView: View {
    // Dependency
    @Binding var count: Int
    
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
    CountControlView(count: .constant(0))
}
