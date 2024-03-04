//
//  OpenURLTestView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct OpenURLTestView: View {
    
    @Environment(\.openURL) var open
    
    var body: some View {
        VStack {
            Button("google") {
                // UIApplication.shared.open(URL(string: "https://www.google.com")!)
                open(URL(string: "https://www.google.com")!)
            }
        }
    }
}

#Preview {
    OpenURLTestView()
}
