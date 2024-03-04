//
//  CountEnvironment.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import Foundation
import SwiftUI

struct CountKey: EnvironmentKey {
    // 저장할 Value의 타입은 Int
    // 항상 default값을 지정해주어야 함
    static var defaultValue: Int = 100
}

extension EnvironmentValues {
    var customCounter: Int {
        // Getter
        get { self[CountKey.self] }
        // Setter
        set { self[CountKey.self] = newValue }
    }
}
