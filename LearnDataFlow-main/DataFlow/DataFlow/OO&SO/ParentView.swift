//
//  ParentView.swift
//  DataFlow
//
//  Created by zumin you on 2023/10/24.
//

import SwiftUI

struct ParentView: View {
    @State private var isOn: Bool = false
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Toggle(isOn: $isOn) {
                    Text("상위 뷰 Dependency 변경")
                }
                Spacer()
            }
            
            // ObservableObject
            OOTestView()
            
            // StateObject
            SOTestView()
        }
    }
}

#Preview {
    ParentView()
}
