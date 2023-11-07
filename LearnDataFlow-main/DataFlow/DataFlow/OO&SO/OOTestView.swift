//
//  OOTestView.swift
//  DataFlow
//
//  Created by zumin you on 2023/10/24.
//

import SwiftUI

/// ObservedObject Test
struct OOTestView: View {
    @ObservedObject var viewModel = CountViewModel()
    
    var body: some View {
        CountControlView(count:
                            $viewModel.count)
    }
}

#Preview {
    OOTestView()
}
