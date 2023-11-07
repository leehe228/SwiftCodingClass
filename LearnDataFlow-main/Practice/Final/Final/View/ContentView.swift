//
//  ContentView.swift
//  Final
//
//  Created by zumin you on 2023/11/05.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @State private var isSheetShow = false
    @State private var selectedUser: User = User()
    
    var body: some View {
        NavigationStack {
            List(viewModel.user.indices, id: \.self) { index in
                NavigationLink {
                    EditUserView(user: $viewModel.user[index])
                } label: {
                    RowView(user: viewModel.user[index])
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
