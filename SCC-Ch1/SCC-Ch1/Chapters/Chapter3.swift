//
//  Chapter3.swift
//  SCC-Ch1
//
//  Created by Hoeun Lee on 10/14/23.
//

import SwiftUI

struct Chapter3: View {
    var body: some View {
        VStack {
            Image(systemName: "airplane")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            
            Image("TestImage1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 400)
                .cornerRadius(30)
            
            Text("2022. 10. 9.")
                .font(.headline)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    Chapter3()
}
