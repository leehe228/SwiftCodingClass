//
//  Chapter3_2.swift
//  SCC-Ch1
//
//  Created by Hoeun Lee on 10/14/23.
//

import SwiftUI

struct Chapter3_2: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.red)
                
                Circle()
                    .frame(width: 200, height: 300)
                    .foregroundColor(.green)
                
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
            }
        }
        
        Spacer()
            .frame(height: 50)
        
        HStack(spacing: 0, content: {
            Spacer()
            
            Image("TestImage1")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            Spacer()
            
            Image("TestImage1")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            Spacer()
        })
        .border(Color.black)
        
        HStack {
            ForEach(0..<15) { num in
                Text("\(num)")
            }
        }
        .border(Color.red)
        
        HStack {
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
            Text("0")
        }
        .border(Color.blue)
    }
}

#Preview {
    Chapter3_2()
}
