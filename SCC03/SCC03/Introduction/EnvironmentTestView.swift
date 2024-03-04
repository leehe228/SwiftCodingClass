//
//  EnvironmentTestView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct EnvironmentTestView: View {
    var body: some View {
        VStack {
            RToLTestView()
            
            RToLTestView()
                .environment(\.layoutDirection, .rightToLeft)
            
            RToLTestView()
                .environment(\.layoutDirection, .leftToRight)
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

#Preview {
    EnvironmentTestView()
}
