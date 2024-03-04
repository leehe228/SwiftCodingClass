//
//  RootFlowObject.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import Foundation
// import Observation

// @Observable
class RootFlowObject: ObservableObject {
    enum CurrentViewType {
        case splash
        case register
        case home
    }
    
    @Published var viewType: CurrentViewType = .splash
}
