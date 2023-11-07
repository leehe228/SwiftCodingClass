//
//  ContentView.swift
//  Starter
//
//  Created by zumin you on 2023/11/06.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var isSheetShow = false
    var selectedUser: User = User()
    
    var body: some View {
        NavigationStack {
            // List(viewModel.user.indices, id: \.self) { index in
            List($viewModel.user) { user in
                NavigationLink {
                    // EditUserView($viewModel.user[index])
                    EditUserView(user: user)
                } label: {
                    // RowView(user: viewModel.user[index])
                    RowView(user: user)
                }
                
            }
        }
        .onAppear() {
            print(viewModel.user.count)
        }
    }
}

struct ContentView2: View {
    var body: some View {
        NavigationStack {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

