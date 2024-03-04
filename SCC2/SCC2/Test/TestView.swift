//
//  TestView.swift
//  SCC2
//
//  Created by Hoeun Lee on 11/21/23.
//

import SwiftUI

struct TestView: View {
    
    var foods: [String] = ["사과가", "마라탕이", "샤브샤브가", "아이스크림이"]
    let direction = Direction.north(latitude: 90.0)
    
    @State private var imageStatus: ImageStatus = .empty
    
    var body: some View {
        VStack {
//            ForEach(foods, id: \.self) { food in
//                Text(food)
//            }
//            
//            switch direction {
//            case .north(let latitude):
//                Text("north, latitude: \(String(format: "%.2f", latitude))")
//            case .south(let latitude):
//                Text("south, latitude: \(String(format: "%.2f", latitude))")
//            case .east(let longitude):
//                Text("east, latitude: \(String(format: "%.2f", longitude))")
//            case .west(let longitude):
//                Text("west, latitude: \(String(format: "%.2f", longitude))")
//            }
            
            Image(systemName: imageStatus.rawValue == 0 ? "person.fill" : "person")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                
            Button("action") {
                imageStatus = ImageStatus(rawValue: (imageStatus.rawValue + 1) % 2) ?? .empty
            }
        }
    }
}

#Preview {
    TestView()
}

enum Direction {
    case north(latitude: Double)
    case south(latitude: Double)
    case east(longitude: Double)
    case west(longitude: Double)
}

enum ImageStatus: Int {
  case fill
  case empty
}
