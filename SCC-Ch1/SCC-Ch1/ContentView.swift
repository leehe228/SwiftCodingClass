//
//  ContentView.swift
//  SCC-Ch1
//
//  Created by Hoeun Lee on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    
    private var viewList: [any View] = [Chapter2(), Chapter3()]
    
    var body: some View {
        NavigationStack(root: {
            List {
                NavigationLink {
                    Chapter2()
                } label: {
                    Text("Chapter2")
                }
                
                NavigationLink {
                    Chapter3()
                } label: {
                    Text("Chapter3")
                }
                
                NavigationLink {
                    Chapter4()
                } label: {
                    Text("Chapter4")
                }
                
                NavigationLink {
                    Chapter7()
                } label: {
                    Text("Chapter7") 
                }
            }
            .navigationTitle("Swift Coding Class")
        })
    }
}

#Preview {
    ContentView()
}
