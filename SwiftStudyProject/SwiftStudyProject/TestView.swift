//
//  ViewModel.swift
//  SwiftStudyProject
//
//  Created by Hoeun Lee on 11/8/23.
//

import SwiftUI
import Foundation

class ViewModel: ObservableObject {
    @Published var count: Int
    
    init() {
        count = 0
    }
    
    func increase() {
        count += 1
    }
}

struct ChildView1: View {
    
    @State var viewModel: ViewModel
    @State private var pcount: Int = 0
    
    var body: some View {
        Button {
            viewModel.increase()
        } label: {
            HStack {
                Text("@State")
                Text("count : \(viewModel.count)")
            }
            .padding()
        }
        .background(.red)
        .foregroundColor(.black)
        .cornerRadius(10)
        
        Button("refresh \(pcount)") {
            pcount += 1
        }
    }
}

struct ChildView2: View {
    
    @Binding var viewModelCount: Int
    @State private var pcount: Int = 0
    
    var body: some View {
        Button {
            viewModelCount += 1
        } label: {
            HStack {
                Text("@Binding")
                Text("count : \(viewModelCount)")
            }
            .padding()
        }
        .background(.yellow)
        .foregroundColor(.black)
        .cornerRadius(10)
        
        Button("refresh \(pcount)") {
            pcount += 1
        }
    }
}

struct ChildView3: View {
    
    @StateObject var viewModel: ViewModel
    @State private var pcount: Int = 0
    
    var body: some View {
        Button {
            viewModel.increase()
        } label: {
            HStack {
                Text("@StateObject")
                Text("count : \(viewModel.count)")
            }
            .padding()
        }
        .background(.green)
        .foregroundColor(.black)
        .cornerRadius(10)
        
        Button("refresh \(pcount)") {
            pcount += 1
        }
    }
}

struct ChildView4: View {
    
    @ObservedObject var viewModel: ViewModel
    @State private var pcount: Int = 0
    
    var body: some View {
        Button {
            viewModel.increase()
        } label: {
            HStack {
                Text("@ObservedObject")
                Text("count : \(viewModel.count)")
            }
            .padding()
        }
        .background(.blue)
        .foregroundColor(.black)
        .cornerRadius(10)
        
        Button("refresh \(pcount)") {
            pcount += 1
        }
    }
}

struct ParentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Button {
                viewModel.increase()
            } label: {
                HStack {
                    Text("Parent View")
                    Text("count : \(viewModel.count)")
                }
                .padding()
            }
            .background(.gray)
            .foregroundColor(.black)
            .cornerRadius(10)
            
            ChildView1(viewModel: viewModel)
            ChildView2(viewModelCount: $viewModel.count)
            ChildView3(viewModel: viewModel)
            ChildView4(viewModel: viewModel)
        }
        
    }
}

struct ParentView2: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Button {
                viewModel.increase()
            } label: {
                HStack {
                    Text("Parent View")
                    Text("count : \(viewModel.count)")
                }
                .padding()
            }
            .background(.gray)
            .foregroundColor(.black)
            .cornerRadius(10)
            
            ChildView1(viewModel: viewModel)
            ChildView2(viewModelCount: $viewModel.count)
            ChildView3(viewModel: viewModel)
            ChildView4(viewModel: viewModel)
        }
        
    }
}

#Preview {
    VStack {
        ParentView()
        ParentView2()
    }
}
