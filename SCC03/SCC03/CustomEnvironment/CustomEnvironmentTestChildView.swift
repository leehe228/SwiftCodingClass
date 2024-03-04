//
//  CustomEnvironmentTestChildView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct CustomEnvironmentTestChildView: View {
    
    @Environment(\.customCounter) var counter
    
    var body: some View {
        // Environment에 저장된 Default 값인 100이 출력
        Text("\(counter)")
    }
}

#Preview {
    CustomEnvironmentTestChildView()
}
