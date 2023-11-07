//
//  SOTestView.swift
//  DataFlow
//
//  Created by zumin you on 2023/10/24.
//

import SwiftUI

struct SOTestView: View {
    @StateObject var viewModel = CountViewModel()
    
    var body: some View {
        CountControlView(count: $viewModel.count)
    }
}

#Preview {
    SOTestView()
}
