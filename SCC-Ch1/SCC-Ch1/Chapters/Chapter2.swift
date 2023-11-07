//
//  Chapter2.swift
//  SCC-Ch1
//
//  Created by Hoeun Lee on 10/14/23.
//

import SwiftUI

struct Chapter2: View {
    @State var isLoggined: Bool = false
    @State var lank: String = "diamond"
    
    var body: some View {
        VStack {
            if isLoggined {
                if (lank == "diamond") {
                    Text("Your Lank is")
                    HStack {
                        Image(systemName: "diamond")
                        Text("Diamond")
                    }
                    Text("Coupon!!")
                } else {
                    Text("no coupon")
                }
            } else {
                Text("Please Login\n")
            }
            
            Button {
                isLoggined.toggle()
            } label: {
                Text(isLoggined ? "Logout" : "Login")
            }
            .buttonStyle(.borderedProminent)
            .foregroundColor(.white)
        }
        .padding()
    }
}

#Preview {
    Chapter2(isLoggined: true, lank: "diamond")
}
