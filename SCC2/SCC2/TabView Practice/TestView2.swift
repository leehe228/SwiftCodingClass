//
//  TestView2.swift
//  SCC2
//
//  Created by Hoeun Lee on 11/21/23.
//

import SwiftUI

struct TestView2: View {
    var body: some View {
        VStack(spacing: 30) {
            CustomView(name: "규니", age: 20, favoriteColor: Color.purple)
            CustomView(name: "피터", age: 21, favoriteColor: Color.red)
            CustomView(name: "리이오", age: 22, favoriteColor: Color.blue)
            CustomView(name: "이호은", age: 23, favoriteColor: Color.green)
        }
    }
}

#Preview {
    TestView2()
}

struct CustomView: View {
    
    @State var name: String
    @State var age: Int
    @State var favoriteColor: Color
    
    var body: some View {
        VStack {
          HStack {
            Text("이름 : ")
            Text(name)
          }
          
          HStack {
            Text("나이 : ")
            Text("\(age)세")
          }
          
          HStack {
            Text("좋아하는 색상 : ")
            RoundedRectangle(cornerRadius: 16)
              .frame(width: 30, height: 15)
              .foregroundStyle(favoriteColor)
          }
        }
        .frame(width: 300, height: 100)
        .background(Color.gray.opacity(0.3))
    }
}

#Preview {
    CustomView(name: "이호은", age: 23, favoriteColor: Color.green)
}
